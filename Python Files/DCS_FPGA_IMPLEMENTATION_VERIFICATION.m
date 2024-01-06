%n_avg = 39895;
%n_int = 40000;
%
%n_i = [];
%n_delta = [];
%ACF_result_1 = (sum(n_i.*n_delta)/n_avg)/(sum(n_i.*n_i)/n_int)
%
%SumBuffer_Den = sum(n_i.^2);
%SumBuffer_Num = sum(n_i .* n_delta);
%ACF_1 = SumBuffer_Num / SumBuffer_Den;
%ACF_result_2 = ACF_1 * (n_int / n_avg)

% Second method:

t_int = 125E-6; %Integration time (Adjusted based on the number of samples desired)
fs = 1E6; %Sampling frequency
n_int = fs*t_int; %Size of n(i) vector

mu = 5;         % Mean
sigma = 2;      % Standard deviation

uniformDist = randi([0,10],1,n_int); %Generating uniformly distributed numbers from 0 to 10


p = 5;
xmin=0;
xmax=10;
num_vals=100;
gaussianDist = round(xmin + (xmax - xmin)*sum(rand(num_vals,p),2)/p); %Generates random integers with Gaussian Distribution

% n = [0, 9, 0, 5, 5, 8, 9, 4, 0, 2, 10, 4, 10, 0, 5, 8, 5, 5, 3, 4, 1, 10, 7, 8, 9, 5, 0, 8, 6, 8, 2, 2, 9, 0, 5, 0, 9, 6, 10, 2, 10, 0, 1, 6, 10, 4, 5, 3, 4, 10, 4, 6, 7, 2, 2, 10, 3, 2, 10, 5, 8, 7, 2, 10, 7, 0, 1, 0, 6, 0, 8, 2, 8, 9, 4, 5, 1, 0, 4, 5, 3, 3, 1, 2, 5, 10, 9, 5, 2, 8, 8, 5, 7, 2, 6, 1, 6, 3, 1, 8, 1, 10, 1, 2, 2, 1, 10, 4, 7, 3, 6, 4, 2, 6, 1, 8, 10, 8, 3, 8, 3, 0, 2, 1, 0];

n = gaussianDist; %Generated samples. Can change between uniformDist and gaussianDist

g2 = []
for(delay_time = logspace(log10(1E-6),log10(125E-6),40)) %Computing Auto Correlation function with logarithmically spaced delay times.

    delta_n = delay_time*fs
    n_avg = n_int - delta_n;

    numerator = n(1:end-delta_n+1) .* n(delta_n:end);
    numerator_timeAvg = sum(numerator)/n_avg;
    denominator = n.^2;
    denominator_timeAvg = sum(denominator)/n_int;
    
    g2(end+1) = numerator_timeAvg/denominator_timeAvg;

end

delayt = logspace(log10(1E-6),log10(125E-6),40); %Plotting computed Auto Correlation function
loglog(delayt,g2)
axis([1E-6,1E-4,0,1.1])

