function value = findS(param)

global model;


c0 = 299792458;
epsilon0 = 8.8541878188*10^(-12);

sigma_value = (param(1) - 1i*param(2))*c0*epsilon0;

model.param.set('sigma', sprintf( ...
    '(%.17g+(%.17g)*i)[S]', ...
    real(sigma_value), imag(sigma_value)));


%%
   
model.sol('sol1').runAll;
model.result.numerical('gev1').setResult;
   
str1 = mphtable(model, 'tbl1');

S11 = str1.data(:, 2);
S21 = str1.data(:, 3);
  
value = abs(S11 + S21);

   
end