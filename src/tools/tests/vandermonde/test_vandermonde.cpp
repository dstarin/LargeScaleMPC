#include <iostream>

#include "../../../tools/vandermonde.h"

int main(int, char**) {


    int n = 16;
    int t = 4;
    int l = n - t;
    std::string filename = "../../../../tools/gf64_generators.txt";

    vandermonde vm_gf64(64, n, l, filename);

    for (int i = 0; i < l+1; i++) {

        for (int j = 0; j < n; j++) {
            printf("%llu ", (unsigned long long) vm_gf64.vm_t[i][j].as_words()[0]);
        }
        printf("\n");
    }

    return 1;
}
