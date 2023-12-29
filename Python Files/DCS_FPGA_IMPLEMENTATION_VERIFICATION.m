n_avg = 39895;
n_int = 40000;

n_i = [];
n_delta = [];
ACF_result_1 = (sum(n_i.*n_delta)/n_avg)/(sum(n_i.*n_i)/n_int)

SumBuffer_Den = sum(n_i.^2);
SumBuffer_Num = sum(n_i .* n_delta);
ACF_1 = SumBuffer_Num / SumBuffer_Den;
ACF_result_2 = ACF_1 * (n_int / n_avg)
