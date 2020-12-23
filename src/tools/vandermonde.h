#ifndef _VANDERMONDE_H_
#define _VANDERMONDE_H_

#include <fstream>

#include <libff/algebra/curves/edwards/edwards_pp.hpp>

#include <libiop/algebra/fft.hpp>
#include <libiop/algebra/fields/gf64.hpp>
#include <libiop/algebra/field_subset/subspace.hpp>
#include <libiop/algebra/utils.hpp>
#include <string>
#include <boost/lexical_cast.hpp>

using namespace libiop;

class vandermonde {
public:

    vandermonde(int w, int _n, int _h, const std::string & filename);
    vandermonde(int w, int _n, int _h, const std::string & filename, bool justGenerator);
    vandermonde(int w, int _n, int _h, const std::string & filename, bool justGenerator, bool every_ten);

    std::vector <gf64> mult_vec(std::vector <gf64> points);
    std::vector <gf64> mult_vec_jg(std::vector <gf64> points);
    std::vector <gf64> mult_vec_et(std::vector <gf64> points);
    std::vector <gf64> mult_vec_op(std::vector <gf64> points);
    std::vector <gf64> mult_vec_4x(std::vector <gf64> points);
    std::vector <gf64> mult_vec_16x(std::vector <gf64> points);
    std::vector <gf64> mult_vec_random(std::vector <gf64> points);


    std::vector <std::vector <gf64>> vm_t;
    std::vector <std::vector <gf64>> vm_et;
    std::vector <gf64> gen;
    int n;
    int h;
};

#endif