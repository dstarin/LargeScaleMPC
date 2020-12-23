#include <cstdint>
#include <gtest/gtest.h>
#include <vector>
#include <libiop/algebra/fields/gf32.hpp>
#include <libff/algebra/curves/edwards/edwards_pp.hpp>
#include <libiop/algebra/fft.hpp>
//#include <libiop/algebra/fields/gf64.hpp>
#include <libiop/algebra/field_subset/subspace.hpp>
#include <libiop/algebra/utils.hpp>
#include <sys/time.h>
#include <sys/resource.h>


using namespace libiop;

double get_time()
{
    struct timeval t;
    struct timezone tzp;
    gettimeofday(&t, &tzp);
    return t.tv_sec + t.tv_usec*1e-6;
}

template<typename FieldT>
std::vector<FieldT> elementwise_random_vector(const std::size_t count)
{
    std::vector<FieldT> result(count);

    for (size_t i = 0; i < count; ++i)
    {
        result[i] = FieldT::random_element();
    }

    return result;
}


TEST(FunctionalityTest, SimpleTest) {
    typedef gf32 FieldT;

    int m = 8;
    int n = ((1ull<<m) / 2);
    int l = 16;

    // generate B1, B2, B3
    field_subset<FieldT> B1 = field_subset<FieldT>(
        affine_subspace<FieldT>::random_affine_subspace(m));
    std::vector <FieldT> B2_basis(m-1);
    std::vector <FieldT> B2_basis_half (m - 2);

    std::vector <FieldT> B3_basis (m - 2);

    // copy m-2 points of basis vector for B2,B3 basis
    for (int i = 0 ; i < m-2 ; i++){
        B2_basis[i] = B1.basis()[i];
        B2_basis_half[i] = B1.basis()[i];
        B3_basis[i] = B1.basis()[i];
    }

    // copy last B2 basis vector
    B2_basis[m-2] = B1.basis()[m-2];

    // B2 is the basis of size 2^{m-1}, unshifted
    // (this corresponds to the points with a 0 coeff in front of v_m)
    field_subset<FieldT> B2 = field_subset<FieldT>(
        affine_subspace <FieldT> (B2_basis, B1.offset()));

    field_subset<FieldT> B2_half = field_subset<FieldT>(
        affine_subspace <FieldT> (B2_basis_half, B1.offset()));

    // B3 is the basis of size 2^{m-2} shifted by v_{m}
    // (the important part is this space is disjoint from the space spanned by B2)
    field_subset<FieldT> B3 = field_subset<FieldT>(
        affine_subspace<FieldT> (B3_basis, B1.offset() + B1.basis()[m-1]));


    // ShareRandom() degree 2^{m-1} - 1 == 2^{m-1} coefficients
    std::vector<FieldT> poly_coeffs = random_vector<FieldT>(((1ull<<m)/4));
    std::vector<FieldT> poly_coeffs_with_zeros ((1ull<<m) / 2);

    for (int i = 0 ; i < (1ull<<m) / 2; i++) {
        if (i < (1ull<<m)/4){
            poly_coeffs_with_zeros[i] = poly_coeffs[i];
        } else {
            poly_coeffs_with_zeros[i] = gf32(0);
        }
    }

    // 
    const std::vector<FieldT> share_random_shares =
        additive_FFT<FieldT>(poly_coeffs_with_zeros, B2.subspace());

    // Share(s_1,...,s_l)
    std::vector<FieldT> secrets = random_vector<FieldT>(l);
    std::vector<FieldT> poly_coeffs_y = random_vector<FieldT>(((1ull<<m)/4 - l));

    std::vector<FieldT> share_points;
    share_points.reserve((1ull<<m)/4);
    share_points.insert( share_points.end(), secrets.begin(), secrets.end() );
    share_points.insert( share_points.end(), poly_coeffs_y.begin(), poly_coeffs_y.end() );


    const std::vector<FieldT> interpolation =
        additive_IFFT<FieldT>(share_points, B3.subspace());

    std::vector <FieldT> intrp_poly_with_zeros ((1ull << m ) /2);

    for (int  i = 0 ; i < (1ull << m) / 2; i++) {
        
        if (i < (1ull << m)/4)
            intrp_poly_with_zeros[i] = interpolation[i];
        else
            intrp_poly_with_zeros[i] = gf32(0);

    }

    const std::vector<FieldT> shares =
        additive_FFT<FieldT>(intrp_poly_with_zeros, B2.subspace());

    // recon pre-mult;
    const std::vector<FieldT> poly_with_zeroes =
        additive_IFFT<FieldT>(shares, B2.subspace());

    std::vector <FieldT> poly_with_coeffs ((1ull>>m)/4);
    for (int i = 0 ; i < (1ull>>m)/4; i++) {
        poly_with_coeffs[i] = poly_with_zeroes[i];
    }

    const std::vector<FieldT> shares_with_secrets =
        additive_FFT<FieldT>(poly_with_coeffs, B3.subspace());

    for (int i = 0; i < l; i++) {
        secrets[i] = shares_with_secrets[i];
    }

    


}

TEST(AdditiveTest, SimpleTest) {
    typedef gf32 FieldT;

    double start;
    double end;
    
    for (size_t m = 1; m <= 20; ++m)
    {
        std::vector<FieldT> poly_coeffs = random_vector<FieldT>(1ull<<m);
        field_subset<FieldT> domain = field_subset<FieldT>(
            affine_subspace<FieldT>::random_affine_subspace(m));

        std::vector<FieldT> additive_result;
   //     std::cout << "m: " << m << " (" << ((1ull<<m)/2) << " parties)" << std::endl;
        start = get_time();
        for (int i = 0 ; i < 50; i++){
        additive_result =
            additive_FFT<FieldT>(poly_coeffs, domain.subspace());
        }
        end = get_time();
        //std::cout << "fft: " << (end - start)/50 << std::endl;
//        std::cout << (end - start)/50 << std::endl;

        std::vector<FieldT> interpolation;
        start = get_time();
        for (int i = 0 ; i < 50; i++){

        interpolation =
            additive_IFFT<FieldT>(additive_result, domain.subspace());
        }
        end = get_time();
//        std::cout << "ifft: " << (end - start)/50 << std::endl;
        std::cout << (end - start)/50 << std::endl;


    }


//        EXPECT_EQ(interpolation, poly_coeffs);
//    }
}

TEST(ThresholdTest, SimpleTest) {
    typedef gf32 FieldT;

    int m = 3;

    // we want to create 2^m shares and reconstruct a 2^(m-1) degree polynomial
    // with any 2^(m-1) of those shares

    // set random packed secrets vector size 2^(m-1)
    std::vector <FieldT> packed_secrets = random_vector<FieldT>((1ull<<m)/2);
    
    // create a random domain affine with length m standard basis vector and random offset
    // domain contains 2^m elements
    field_subset<FieldT> domain = field_subset<FieldT>(
        affine_subspace<FieldT>::random_affine_subspace(m));

    // create half domain with length m-1 basis vector
    // domain will contain 2^(m-1) elements
    std::vector <FieldT> half_domain_basis(m-1);

    // half domain 2nd will contain the 2nd half of the points
    std::vector <FieldT> half_domain_basis_2nd (m -1);

    // copy m-1 points of basis vector for half_domain_basis
    for (int i = 0 ; i < m-1 ; i++){
        half_domain_basis[i] = domain.basis()[i];
    }

    // copy m-1 points of basis vector for half_domain_basis_2nd
    for (int i = 0 ; i < m-1 ; i++){
        half_domain_basis_2nd[i] = domain.basis()[i];
    }

    // construct domain_half with 2^(m-1) elements
    // using m-1 length half_domain_basis and same offset from domain
    field_subset<FieldT> domain_half = field_subset<FieldT>(
        affine_subspace <FieldT> (half_domain_basis, domain.offset()));

    // construct domain_half_2nd with 2^(m-1) elements
    // using m-1 length half_domain_basis and offset + last domain basis vector value
    // to give you second half of domain points
    field_subset<FieldT> domain_half_2nd = field_subset<FieldT>(
        affine_subspace <FieldT> (half_domain_basis_2nd, domain.offset() + domain.basis()[m-1]));

    // now eval IFFT with packed secrets on domain_half_2nd
    const std::vector<FieldT> interpolation =
        additive_IFFT<FieldT>(packed_secrets,domain_half_2nd.subspace());

    // now we have coeffients, evaluate FFT on coefficients for first half share points
    const std::vector<FieldT> shares =
        additive_FFT<FieldT>(interpolation, domain_half.subspace());

    // now rebuild based on shares

    const std::vector<FieldT> recovered_coeffs =    
        additive_IFFT<FieldT>(shares,domain_half.subspace());
    
    // now generate secret packed points from 2nd half domain
    const std::vector<FieldT> packed_secrets_recovered =
        additive_FFT<FieldT>(recovered_coeffs,domain_half_2nd.subspace());
    
    //   EXPECT_EQ(packed_secrets, domain.all_elements());

    //   EXPECT_EQ(packed_secrets_recovered, domain.all_elements());

    EXPECT_EQ(packed_secrets, packed_secrets_recovered);

}

TEST(PackedTest, SimpleTest) {
    typedef gf32 FieldT;

    for (size_t m = 3; m <= 3; m+=2)
    {
        // set random packed secrets vector size 2^(m-1)
        std::vector <FieldT> packed_secrets = random_vector<FieldT>((1ull<<m)/2);
       
        // create a random domain affine with length m standard basis vector and random offset
        // domain contains 2^m elements
        field_subset<FieldT> domain = field_subset<FieldT>(
            affine_subspace<FieldT>::random_affine_subspace(m));

        // create half domain with length m-1 basis vector
        // domain will contain 2^(m-1) elements
        std::vector <FieldT> half_domain_basis(m-1);

        // half domain 2nd will contain the 2nd half of the points
        std::vector <FieldT> half_domain_basis_2nd (m -1);

        // copy m-1 points of basis vector for half_domain_basis
        for (int i = 0 ; i < m-1 ; i++){
            half_domain_basis[i] = domain.basis()[i];
        }

        // copy m-1 points of basis vector for half_domain_basis_2nd
        for (int i = 0 ; i < m-1 ; i++){
            half_domain_basis_2nd[i] = domain.basis()[i];
        }

        // construct domain_half with 2^(m-1) elements
        // using m-1 length half_domain_basis and same offset from domain
        field_subset<FieldT> domain_half = field_subset<FieldT>(
            affine_subspace <FieldT> (half_domain_basis, domain.offset()));

        // construct domain_half_2nd with 2^(m-1) elements
        // using m-1 length half_domain_basis and offset + last domain basis vector value
        // to give you second half of domain points
        field_subset<FieldT> domain_half_2nd = field_subset<FieldT>(
            affine_subspace <FieldT> (half_domain_basis_2nd, domain.offset() + domain.basis()[m-1]));

        // now eval IFFT with packed secrets on domain_half_2nd
        const std::vector<FieldT> interpolation =
            additive_IFFT<FieldT>(packed_secrets,domain_half_2nd.subspace());

        // now we have coeffients, evaluate FFT on coefficients for first half share points
        const std::vector<FieldT> shares =
            additive_FFT<FieldT>(interpolation, domain_half.subspace());

        // now rebuild based on shares
        const std::vector<FieldT> recovered_coeffs =
            additive_IFFT<FieldT>(shares,domain_half.subspace());
     
        // now generate secret packed points from 2nd half domain
        const std::vector<FieldT> packed_secrets_recovered =
            additive_FFT<FieldT>(recovered_coeffs,domain_half_2nd.subspace());
     
     //   EXPECT_EQ(packed_secrets, domain.all_elements());

     //   EXPECT_EQ(packed_secrets_recovered, domain.all_elements());

        EXPECT_EQ(packed_secrets, packed_secrets_recovered);

    }
}



TEST(HalfTest, SimpleTest) {
    typedef gf32 FieldT;

    for (size_t m = 3; m <= 3; m+=2)
    {
        
        // 2^m random coefficients each in GF(64)
        std::vector<FieldT> poly_coeffs = random_vector<FieldT>(1ull<<m);


        // we want poly_coeffs with degree 2^(m-1) and lower only
        for (int i = 0; i < (1ull<<m); i++) {
            poly_coeffs[i] = gf32(0);
        }
        poly_coeffs[1] = gf32(1);

        // create poly_coeffs_half with just the non-zero coefficients
        std::vector <FieldT> poly_coeffs_half;
        poly_coeffs_half.resize((1ull<<m)/2);

        for (int i = 0; i < ((1ull<<m)/2); i++) {
            poly_coeffs_half[i] = poly_coeffs[i];
        }

        // create a random domain affine with length m basis vector? and random offset
        // domain contains 2^m elements
        field_subset<FieldT> domain = field_subset<FieldT>(
            affine_subspace<FieldT>::random_affine_subspace(m));

       // field_subset <FieldT> domain = field_subset <FieldT> (
       //     affine_subspace<FieldT> (linear_subspace<FieldT>::standard_basis(m), gf32(0))
       // );

        // create half domain with length m-1 basis vector
        // domain will contain 2^(m-1) elements
        std::vector <FieldT> half_domain_basis(m-1);

        std::vector <FieldT> half_domain_basis_2nd (m -1);

        // copy m-1 points of basis vector for half_domain_basis
        for (int i = 0 ; i < m-1 ; i++){
            half_domain_basis[i] = domain.basis()[i];
        }

        // copy m-1 points of basis vector for half_domain_basis
        for (int i = 0 ; i < m-1 ; i++){
            half_domain_basis_2nd[i] = domain.basis()[i];
        }


        EXPECT_EQ(domain.all_elements(), domain.basis());
//        std::cout << "basis: " << domain.basis() << std::endl;

        // construct domain_half with 2^(m-1) elements
        // using m-1 length half_domain_basis and same offset from domain
        field_subset<FieldT> domain_half = field_subset<FieldT>(
            affine_subspace <FieldT> (half_domain_basis, domain.offset()));

        field_subset<FieldT> domain_half_2nd = field_subset<FieldT>(
            affine_subspace <FieldT> (half_domain_basis_2nd, domain.offset() + domain.basis()[m-1]));

        // calculate 2^m points using additive FFT 
        const std::vector<FieldT> additive_result =
            additive_FFT<FieldT>(poly_coeffs, domain.subspace());     

        const std::vector<FieldT> additive_result_half =
            additive_FFT<FieldT>(poly_coeffs, domain_half.subspace()); 

        const std::vector<FieldT> additive_result_half_2nd =
            additive_FFT<FieldT>(poly_coeffs, domain_half_2nd.subspace()); 


        EXPECT_EQ(additive_result, additive_result_half);

        EXPECT_EQ(additive_result_half_2nd, domain.all_elements());

        EXPECT_EQ(additive_result, domain.basis());


        const std::vector<FieldT> first_half_coeffs =
            additive_IFFT<FieldT>(additive_result_half, domain_half.subspace()); 

        EXPECT_EQ(first_half_coeffs, domain.all_elements());


        // create variable to store half of the calculated points
        std::vector <FieldT> half_points((1ull<<m)/2);

        // store first half of the calculated points
        for (int i = 0 ; i < (1ull<<m)/2 ; i++){
            half_points[i] = additive_result[i];
        }

        // interpolate polynomial using half of the points and the half domain
        const std::vector<FieldT> interpolation =
            additive_IFFT<FieldT>(half_points,domain_half.subspace());

        // verify that interpolated polynomial from half of the points
        // matches the first half of the coefficents from the original polynomial
        EXPECT_EQ(interpolation, poly_coeffs_half);

        // 2^m with 2 separate half spaces, m-1

        // program in points for packed secret sharing
        // interpolate that polynomial
        // evaluate again 


    }
}


TEST(AdditiveTestDouble, SimpleTest) {
    typedef gf32 FieldT;

    for (size_t m = 2; m <= 12; m+=2)
    {
        
        // 2^m random coefficients each in GF(64)
        std::vector<FieldT> poly_coeffs = random_vector<FieldT>(1ull<<m);

        // we want poly_coeffs with degree 2^(m-1) and lower
        for (int i = (1ull<<m)/2; i < (1ull<<m); i++) {
            poly_coeffs[i] = gf32(0);
        }

        std::vector <FieldT> poly_coeffs_half;
        poly_coeffs_half.resize((1ull<<m)/2);
        
        for (int i = 0; i < ((1ull<<m)/2); i++) {
            poly_coeffs_half[i] = poly_coeffs[i];
        }

        field_subset<FieldT> domain = field_subset<FieldT>(
            affine_subspace<FieldT>::random_affine_subspace(m));

        std::vector <FieldT> domain_vector = domain.all_elements();

        std::cout << "domain_vector size: " << domain.all_elements().size() << std::endl;

        std::vector <FieldT> half_domain_basis(m-1);

        for (int i = 0 ; i < m-1 ; i++){
            half_domain_basis[i] = domain.basis()[i];
        }

        field_subset<FieldT> domain_half = field_subset<FieldT>(
            affine_subspace <FieldT> (half_domain_basis, domain.offset()));
//            affine_subspace<FieldT>::random_affine_subspace(m-1));

        std::cout << "half_domain_basis size: " << half_domain_basis.size() << std::endl;
        std::cout << "domain half size: " << domain_half.all_elements().size() << std::endl;




        /* Additive equals naive */
        const std::vector<FieldT> naive_result =
            naive_FFT<FieldT>(poly_coeffs, domain);
        const std::vector<FieldT> additive_result =
            additive_FFT<FieldT>(poly_coeffs, domain.subspace());

        EXPECT_EQ(naive_result, additive_result);


        const std::vector<FieldT> naive_result_half =
            naive_FFT<FieldT>(poly_coeffs_half, domain_half);

        const std::vector<FieldT> additive_result_half =
            additive_FFT<FieldT>(poly_coeffs_half, domain_half.subspace());


        std::cout << "coeffs size: " << poly_coeffs.size() << std::endl;
        std::cout << "result size: " << naive_result.size() << std::endl;

        std::cout << "coeffs half size: " << poly_coeffs_half.size() << std::endl;
        std::cout << "result size half: " << naive_result_half.size() << std::endl;
        std::cout << "additive result size half: " << additive_result_half.size() << std::endl;

        std::cout << "domain num elements: " << domain.num_elements() << std::endl;
        std::cout << "half domain num elements: " << domain_half.num_elements() << std::endl;

        // now take every other share of the additive result

        /* Inverse interpolates naive */
        
        const std::vector<FieldT> new_naive_result =
            naive_FFT<FieldT>(poly_coeffs, domain);     

        std::vector <FieldT> half_points((1ull<<m)/2);

        // every other point 0, 2, 4, 6
/*
        for (int i = 0 ; i < 1ull<<m ; i+=2){
            half_points[i/2] = new_naive_result[i];
        }
*/

        // every other point 1, 3, 5, 7...
        /*
        for (int i = 1 ; i < 1ull<<m ; i+=2){
            half_points[i/2] = new_naive_result[i];
        }
        */

       // first half points
        for (int i = 0 ; i < (1ull<<m)/2 ; i++){
            half_points[i] = new_naive_result[i];
        }



      //  field_subset<FieldT> domain_half_other = 
        
      //  domain.get_subset_of_order(2^(m-2));

        std::cout << "half domain other num elements: " << domain_half.num_elements() << std::endl;


        const std::vector<FieldT> interpolation =
            additive_IFFT<FieldT>(half_points,domain_half.subspace());

        EXPECT_EQ(interpolation, poly_coeffs_half);


          /* Inverse interpolates naive */
/*        const std::vector<FieldT> new_naive_result =
            naive_FFT<FieldT>(poly_coeffs, domain);
        const std::vector<FieldT> interpolation =
            additive_IFFT<FieldT>(new_naive_result, domain.subspace());

        EXPECT_EQ(interpolation, poly_coeffs);
*/
    }
}

TEST(MultiplicativeSubgroupTest, SimpleTest) {
    edwards_pp::init_public_params();
    typedef edwards_Fr FieldT;

    for (size_t domain_dim = 1; domain_dim < 10; domain_dim++)
    {
        for (size_t poly_dim = 1; poly_dim <= domain_dim; poly_dim++)
        {
            std::vector<FieldT> poly_coeffs = elementwise_random_vector<FieldT>(1ull<<domain_dim);
            field_subset<FieldT> domain(1ull << domain_dim);

            /* Multiplicative equals naive */
            const std::vector<FieldT> naive_result =
                naive_FFT<FieldT>(poly_coeffs, domain);
            const std::vector<FieldT> multiplicative_result =
                multiplicative_FFT<FieldT>(poly_coeffs, domain.coset());

            EXPECT_EQ(naive_result, multiplicative_result);

            /* Inverse interpolates naive */
            const std::vector<FieldT> new_naive_result =
                naive_FFT<FieldT>(poly_coeffs, domain);
            const std::vector<FieldT> interpolation =
                multiplicative_IFFT<FieldT>(new_naive_result, domain.coset());

            EXPECT_EQ(interpolation, poly_coeffs);
        }
    }
}

TEST(MultiplicativeCosetTest, SimpleTest) {
    edwards_pp::init_public_params();

    typedef edwards_Fr FieldT;

    for (size_t m = 1; m <= 11; ++m)
    {
        std::vector<FieldT> poly_coeffs = elementwise_random_vector<FieldT>(1ull<<m);
        FieldT shift = FieldT::random_element();

        field_subset<FieldT> domain = field_subset<FieldT>(
            multiplicative_coset<FieldT>(1ull<<m, shift));

        /* Multiplicative equals naive */
        const std::vector<FieldT> naive_result =
            naive_FFT<FieldT>(poly_coeffs, domain);
        const std::vector<FieldT> multiplicative_result =
            multiplicative_FFT<FieldT>(poly_coeffs, domain.coset());
        EXPECT_EQ(naive_result, multiplicative_result);

        /* Inverse interpolates naive */
        const std::vector<FieldT> new_naive_result =
            naive_FFT<FieldT>(poly_coeffs, domain);
        const std::vector<FieldT> interpolation =
            multiplicative_IFFT<FieldT>(new_naive_result, domain.coset());
        EXPECT_EQ(interpolation, poly_coeffs);
    }
}

TEST(ExtendedRangeTest, SimpleTest) {
    typedef gf32 FieldT;

    for (size_t m = 1; m <= 21; ++m)
    {
        std::vector<FieldT> poly_coeffs = random_vector<FieldT>(1ull<<m);
        field_subset<FieldT> domain = field_subset<FieldT>(
            affine_subspace<FieldT>::random_affine_subspace(m));

        const std::vector<FieldT> additive_result =
            additive_FFT<FieldT>(poly_coeffs, domain.subspace());
        const std::vector<FieldT> interpolation =
            additive_IFFT<FieldT>(additive_result, domain.subspace());

        EXPECT_EQ(interpolation, poly_coeffs);
    }
}
