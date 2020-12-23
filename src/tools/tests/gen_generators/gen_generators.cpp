#include <iostream>
 
#include <libff/algebra/curves/edwards/edwards_pp.hpp>

#include <libiop/algebra/fft.hpp>
#include <libiop/algebra/fields/gf64.hpp>
#include <libiop/algebra/field_subset/subspace.hpp>
#include <libiop/algebra/utils.hpp>

#include <gf_complete.h>
#include <gf_rand.h>
#include <math.h>
#include <inttypes.h>
#include <map>

using namespace libiop;

int main(int, char**) {
    typedef gf64 FieldT;
    std::vector<FieldT> genVector = random_vector<FieldT>(1);
    FieldT gen = genVector[0];
    
    uint64_t max64 = 0;
    for (int i = 0; i < 64; i++)
        max64 |= ((uint64_t)1) << i;

    FieldT s = FieldT(max64);


    // to use non 2^64 size field, need to fine primes
    // https://proofwiki.org/wiki/Prime_Factors_of_2%5E64_-_1

    std::vector <unsigned long long> primes (7);
    primes[0] = 3;
    primes[1] = 5;
    primes[2] = 17;
    primes[3] = 257;
    primes[4] = 641;
    primes[5] = 65537;
    primes[6] = 6700417;
    
    int toFind = 1000000;

    std::map <uint64_t, bool> random_vals;
    int notFound = 0;
    while ( true ) {
        std::vector<FieldT> genVector = random_vector<FieldT>(1);
        FieldT gen = genVector[0];


//        printf("gen: ");
  //      gen.print();
        uint64_t max64 = 0;
        for (int i = 0; i < 64; i++)
            max64 |= ((uint64_t)1) << i;

        FieldT s = FieldT(max64);

        // s.print();
        bool found = true;
        for (int i = 0; i < primes.size(); i++) {
            unsigned long long pow = ((unsigned long long)s.as_words()[0]) / primes[i];
  //          printf("prime: %llu\n", primes[i]);
//            printf("s: %llu\n", (unsigned long long)s.as_words()[0]);
//            printf("pow: %llu\n", pow);
  //          printf("log2(pow): %d\n", (int)floor(log2(pow)));


            FieldT y = FieldT(1);
            FieldT x = gen;            
            while (pow > 1) {
                if ( pow % 2 == 0) { 
                    x = x.squared();
                    pow = pow / 2;
                }
                else {
                    y = x * y;
                    x = x.squared();
                    pow = (pow - 1) / 2;
                }
            }
            FieldT tot = x * y;

            if (tot == FieldT(1))
                found = false;        
            
        }
        if (found){
            if ( random_vals.find(gen.as_words()[0]) == random_vals.end()) {
                random_vals[gen.as_words()[0]] = true;
//                gen.print();
                printf("%llu\n", (unsigned long long)gen.as_words()[0]);
                toFind--;

                if (toFind == 0){
//                     printf("\n%f\n", (float)((float)notFound /(10000+notFound)));
                    exit(-1);
                }
                
            }
        } else {
            notFound++;
//            printf("not found!\n");
        }
    }
    return 1;
}
