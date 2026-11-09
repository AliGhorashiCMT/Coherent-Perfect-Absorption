function value = find_abs(param, model)

% g = Z_0*sigma
g_R = param(1);
g_I = param(2);

model.param.set('sig_r', sprintf('%.17g', g_R));
model.param.set('sig_i', sprintf('%.17g', g_I));

model.sol('sol1').runAll;

model.result.numerical('gev1').setResult;
str1 = mphtable(model, 'tbl1');

Absorpbtion = str1.data(:, end);

assert(isscalar(Absorpbtion) && isreal(Absorpbtion) ...
    && isfinite(Absorpbtion), ...
    'Expected one finite real absorption value.');

value = -Absorpbtion;

end