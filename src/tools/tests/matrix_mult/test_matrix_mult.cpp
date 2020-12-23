#include <iostream>

#include "../../../tools/vandermonde.h"
#include <sys/time.h>
#include <sys/resource.h>

double get_time()
{
    struct timeval t;
    struct timezone tzp;
    gettimeofday(&t, &tzp);
    return t.tv_sec + t.tv_usec*1e-6;
}

int main(int, char**) {

    typedef gf64 FieldT;
    double start;
    double end;

    std::string filename = "../../../../tools/gf64_generators.txt";
    for (int m = 2; m < 20; m++){

        int n = 1ull<<m;
        int t = n/3;
        int h = (n - t);
        if (h < 2)
            h = 2;
      //  std::cout << "(n, t, h): (" << n << " , " << t << ", " << h << ", ";
        std::cout.flush();
        vandermonde vm_t_gf64(64, n, h, filename);

        std::vector <FieldT> points = random_vector<FieldT>(n);
        std::vector <FieldT> res;
        FieldT resMult;
        start = get_time();
        res = vm_t_gf64.mult_vec_16x(points);
//        for (int i = 0 ; i < 1000; i++)
  //          resMult = points[0]*points[1];// + points[2];
        end = get_time();
        std::cout << (end - start) << std::endl;

        
    }

    return 1;
}
