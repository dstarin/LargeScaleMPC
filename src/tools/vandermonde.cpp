#include "vandermonde.h"

vandermonde::vandermonde(int w, int _n, int _h, const std::string & filename) {

    if (w != 64) {
        std::cout << "only 2^64 vandermonde matrix generated. Look at tools/gen_generator to create new generator list." << std::endl;
        exit (-1);
    }

    n = _n;
    h = _h;

    vm_t.resize(h);

    std::ifstream infile(filename);

    std::string line;
    vm_t[0].resize(n);
    for (int j = 0; j < n; j++)
        vm_t[0][j] = gf64(1);

    vm_t[1].resize(n);
    for (int j = 0; j < n; j++){
        infile >> line;        
        uint64_t alpha = boost::lexical_cast<uint64_t>(line);
        vm_t[1][j] = gf64(alpha);
    }

    for (int i = 2; i < h; i++) {
        vm_t[i].resize(n);

        for (int j = 0 ; j < n; j++)
            vm_t[i][j] = vm_t[i-1][j] * vm_t[1][j];     
    }
}

vandermonde::vandermonde(int w, int _n, int _h, const std::string & filename, bool just_generators) {

    if (w != 64) {
        std::cout << "only 2^64 vandermonde matrix generated. Look at tools/gen_generator to create new generator list." << std::endl;
        exit (-1);
    }

    n = _n;
    h = _h;

    gen.resize(n);

    std::ifstream infile(filename);

    std::string line;

//    for (int j = 0; j < n; j++)
//        vm_t[0][j] = gf64(1);

//    vm_t[1].resize(n);
    for (int j = 0; j < n; j++){
        infile >> line;        
        uint64_t alpha = boost::lexical_cast<uint64_t>(line);
   //     vm_t[1][j] = gf64(alpha);
        gen[j] = gf64(alpha);
    }

//    for (int i = 2; i < h; i++) {
//        vm_t[i].resize(n);

//        for (int j = 0 ; j < n; j++)
//            vm_t[i][j] = vm_t[i-1][j] * vm_t[1][j];     
//    }
}


vandermonde::vandermonde(int w, int _n, int _h, const std::string & filename, bool just_generators, bool every_ten) {

    if (w != 64) {
        std::cout << "only 2^64 vandermonde matrix generated. Look at tools/gen_generator to create new generator list." << std::endl;
        exit (-1);
    }

    n = _n;
    h = _h;

    gen.resize(n);
    vm_et.resize(h);
    vm_et[0].resize(n);
    vm_et[1].resize(n);

    std::ifstream infile(filename);

    std::string line;

    for (int j = 0; j < n; j++)
        vm_et[0][j] = gf64(1);


    for (int j = 0; j < n; j++){

        infile >> line;        

        uint64_t alpha = boost::lexical_cast<uint64_t>(line);

        vm_et[1][j] = gf64(alpha);

        gen[j] = gf64(alpha);
    }

    for (int i = 2; i < h/3+1; i++) {
        vm_et[i].resize(n);
        for (int j = 0 ; j < n; j++){
            vm_et[i][j] = vm_et[i-1][j] * vm_et[1][j];     
            for (int k = 0; k < 3; k++)
                vm_et[i][j] = vm_et[i][j] * vm_et[1][j];     
        }
    }
}

std::vector <gf64> vandermonde::mult_vec(std::vector <gf64> points) {

    if (points.size() != n) {
        std::cout << "points vector sent to vandermonde mult_vec is not size n" << std::endl;
        exit(-1);
    }
    std::vector <gf64> res (h);

    for (int i = 0 ; i < h; i++) {

        gf64 val = gf64(0);
        for (int j = 0; j < n; j++)
            val = val + vm_t[i][j]*points[j];

        res[i] = val;
    }

    return res;
}

std::vector <gf64> vandermonde::mult_vec_jg(std::vector <gf64> points) {

    if (points.size() != n) {
        std::cout << "points vector sent to vandermonde mult_vec is not size n" << std::endl;
        exit(-1);
    }
    std::vector <gf64> res (h);
    std::vector <gf64> vm_col (n);
    gf64 vm_val;
    for (int i = 0 ; i < h; i++) {
        gf64 val = gf64(0);

        val = val + gf64(1)*points[0];
        val = val + gen[i]*points[1];
        

        for (int j = 2; j < n; j++){
            vm_val = vm_val * gen[i];
            val = val + vm_val*points[j];
        }
        res[i] = val;
    }

    return res;
}

std::vector <gf64> vandermonde::mult_vec_et(std::vector <gf64> points) {

    if (points.size() != n) {
        std::cout << "points vector sent to vandermonde mult_vec is not size n" << std::endl;
        exit(-1);
    }
    std::vector <gf64> res (h);
    for (int i = 0 ; i < h; i++) {

        gf64 val = gf64(0);
        gf64 mult_val;
        for (int j = 0; j < n; j++){
            if (i < 2)
                val = val + vm_et[i][j]*points[j];
            else {
                int index = i/3;
                int mults = i%3;
                mult_val = vm_et[index][j];
                for (int k = 0; k < mults; k++)
                    mult_val = mult_val * vm_et[1][j];
                val = val + mult_val*points[j];
            }
        }

        res[i] = val;
    }

    return res;
}
std::vector <gf64> vandermonde::mult_vec_op(std::vector <gf64> points) {

    if (points.size() != n) {
        std::cout << "points vector sent to vandermonde mult_vec is not size n" << std::endl;
        exit(-1);
    }
    std::vector <gf64> res (h);
    gf64 val;

    for (int i = 0 ; i < h; i++) {

        int j = 0;
        val = gf64(0);
        for (; j <= n-4; j+=4)
        {
            val = val + vm_t[i][j]*points[j];
            val = val + vm_t[i][j+1]*points[j+1];
            val = val + vm_t[i][j+2]*points[j+2];
            val = val + vm_t[i][j+3]*points[j+3];
        }

        for (; j < n; j++)
            val = val + vm_t[i][j]*points[j];

        res[i] = val;
    }

    return res;
}

std::vector <gf64> vandermonde::mult_vec_4x(std::vector <gf64> points){

    if (points.size() != n) {
        std::cout << "points vector sent to vandermonde mult_vec is not size n" << std::endl;
        exit(-1);
    }
    std::vector <gf64> res0 (h);
    std::vector <gf64> res1 (h);
    std::vector <gf64> res2 (h);
    std::vector <gf64> res3 (h);

    gf64 val0;
    gf64 val1;
    gf64 val2;
    gf64 val3;

    for (int i = 0 ; i < h; i++) {

        val0 = gf64(0);
        val1 = gf64(0);
        val2 = gf64(0);
        val3 = gf64(0);

        for (int j = 0; j < n; j++){
            val0 = val0 + vm_t[i][j]*points[j];
            val1 = val1 + vm_t[i][j]*points[j];
            val2 = val2 + vm_t[i][j]*points[j];
            val3 = val3 + vm_t[i][j]*points[j];        
        }
        res0[i] = val0;
        res1[i] = val1;
        res2[i] = val2;
        res3[i] = val3;

    }

    return res0;

}

std::vector <gf64> vandermonde::mult_vec_16x(std::vector <gf64> points){

    if (points.size() != n) {
        std::cout << "points vector sent to vandermonde mult_vec is not size n" << std::endl;
        exit(-1);
    }
    std::vector <gf64> res0 (h);
    std::vector <gf64> res1 (h);
    std::vector <gf64> res2 (h);
    std::vector <gf64> res3 (h);
    std::vector <gf64> res4 (h);
    std::vector <gf64> res5 (h);
    std::vector <gf64> res6 (h);
    std::vector <gf64> res7 (h);
    std::vector <gf64> res8 (h);
    std::vector <gf64> res9 (h);
    std::vector <gf64> res10 (h);
    std::vector <gf64> res11 (h);
    std::vector <gf64> res12 (h);
    std::vector <gf64> res13 (h);
    std::vector <gf64> res14 (h);
    std::vector <gf64> res15 (h);

    gf64 val0;
    gf64 val1;
    gf64 val2;
    gf64 val3;
    gf64 val4;
    gf64 val5;
    gf64 val6;
    gf64 val7;
    gf64 val8;
    gf64 val9;
    gf64 val10;
    gf64 val11;
    gf64 val12;
    gf64 val13;
    gf64 val14;
    gf64 val15;

    for (int i = 0 ; i < h; i++) {

        val0 = gf64(0);
        val1 = gf64(0);
        val2 = gf64(0);
        val3 = gf64(0);
        val4 = gf64(0);
        val5 = gf64(0);
        val6 = gf64(0);
        val7 = gf64(0);
        val8 = gf64(0);
        val9 = gf64(0);
        val10 = gf64(0);
        val11 = gf64(0);
        val12 = gf64(0);
        val13 = gf64(0);
        val14 = gf64(0);
        val15 = gf64(0);

        for (int j = 0; j < n; j++){
            val0 = val0 + vm_t[i][j]*points[j];
            val1 = val1 + vm_t[i][j]*points[j];
            val2 = val2 + vm_t[i][j]*points[j];
            val3 = val3 + vm_t[i][j]*points[j];        
            val4 = val4 + vm_t[i][j]*points[j];
            val5 = val5 + vm_t[i][j]*points[j];
            val6 = val6 + vm_t[i][j]*points[j];
            val7 = val7 + vm_t[i][j]*points[j];        
            val8 = val8 + vm_t[i][j]*points[j];
            val9 = val9 + vm_t[i][j]*points[j];
            val10 = val10 + vm_t[i][j]*points[j];
            val11 = val11 + vm_t[i][j]*points[j];        
            val12 = val12 + vm_t[i][j]*points[j];
            val13 = val13 + vm_t[i][j]*points[j];
            val14 = val14 + vm_t[i][j]*points[j];
            val15 = val15 + vm_t[i][j]*points[j];        

        }
        res0[i] = val0;
        res1[i] = val1;
        res2[i] = val2;
        res3[i] = val3;
        res4[i] = val4;
        res5[i] = val5;
        res6[i] = val6;
        res7[i] = val7;
        res8[i] = val8;
        res9[i] = val9;
        res10[i] = val10;
        res11[i] = val11;
        res12[i] = val12;
        res13[i] = val13;
        res14[i] = val14;
        res15[i] = val15;


    }

    return res0;

}

std::vector <gf64> vandermonde::mult_vec_random(std::vector <gf64> points) {

    if (points.size() != n) {
        std::cout << "points vector sent to vandermonde mult_vec is not size n" << std::endl;
        exit(-1);
    }
    std::vector <gf64> res (h);
    std::vector <gf64> randMask = random_vector <gf64> (1); 

    for (int i = 0 ; i < h; i++) {

        gf64 val = gf64(0);
        for (int j = 0; j < n; j++)
            val = val + vm_t[i][j]*points[j];

        res[i] = val + gf64(1);
    }

    return res;
}
