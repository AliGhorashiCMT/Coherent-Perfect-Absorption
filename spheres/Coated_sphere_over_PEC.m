
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);
model.component('comp1').geom('geom1').axisymmetric(true);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').physics.create('emw', 'ElectromagneticWaves', 'geom1');

%%
model.param.set('lambda_0', '1[um]');
model.param.descr('lambda_0', 'Wavelength of the incident beam');

model.param.set('eps_r', '2.1');
model.param.set('eps_i', '0');

model.param.set('E_a', '1[V/m]');
model.param.descr('E_a', 'Amplitude');

model.param.set('R_s', '0.05*lambda_0');
model.param.set('h_s', 'lambda_0/4');
model.param.set('k_0', '2*pi/lambda_0');
model.param.set('f_0', 'c_const/lambda_0');
model.param.set('Z_0', 'sqrt(mu0_const/epsilon0_const)');

model.param.set('R_p', 'h_s + R_s + 2*lambda_0');
model.param.set('t_pml', '0.5*lambda_0');
model.param.set('R_o', 'R_p + t_pml');

model.param.set('sig_r', '0.0138805481');
model.param.set('sig_i', '-0.6805360841');
model.param.set('sig', '(sig_r + i*sig_i)/Z_0');
%%
model.func.create('an1', 'Analytic');
model.func('an1').set('funcname', 'Ureg');
model.func('an1').set('expr', 'if(abs(q)<0.1,1/3-q/30+q^2/840-q^3/45360+q^4/3991680,(sin(sqrt(q))-sqrt(q)*cos(sqrt(q)))/(q*sqrt(q)))');
model.func('an1').set('args', 'q');
model.func.create('an2', 'Analytic');
model.func('an2').set('funcname', 'Vreg');
model.func('an2').set('expr', 'if(abs(q)<0.1,1/15-q/210+q^2/7560-q^3/498960+q^4/51891840,((3-q)*sin(sqrt(q))-3*sqrt(q)*cos(sqrt(q)))/(q^2*sqrt(q)))');
model.func('an2').set('args', 'q');
model.func('an2').set('fununit', '1');
model.func('an2').setIndex('argunit', 1, 0);

model.param.set('P_in', 'pi*abs(E_a)^2*(1/3+Ureg(4*(k_0*h_s)^2))/(4*Z_0*k_0^2)');

model.component('comp1').geom('geom1').create('c1', 'Circle');
model.component('comp1').geom('geom1').feature('c1').set('r', 'R_p');
model.component('comp1').geom('geom1').feature('c1').set('angle', 90);

model.component('comp1').geom('geom1').create('c2', 'Circle');
model.component('comp1').geom('geom1').feature('c2').set('r', 'R_s');
model.component('comp1').geom('geom1').feature('c2').set('angle', 180);
model.component('comp1').geom('geom1').feature('c2').set('rot', -90);
model.component('comp1').geom('geom1').feature('c2').set('pos', {'0' 'h_s'});

model.component('comp1').geom('geom1').create('c3', 'Circle');
model.component('comp1').geom('geom1').feature('c3').set('r', 'R_o');
model.component('comp1').geom('geom1').feature('c3').set('angle', 90);

model.component('comp1').geom('geom1').create('c4', 'Circle');

model.component('comp1').geom('geom1').create('dif1', 'Difference');

model.component('comp1').geom('geom1').feature('c4').set('angle', 90);
model.component('comp1').geom('geom1').feature('c4').set('r', 'R_p');

model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'c3'});
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'c4'});

model.component('comp1').geom('geom1').run;

model.component('comp1').variable.create('var1');
model.component('comp1').variable('var1').set('Q_p', 'k_0^2*(r^2+(z-h_s)^2)');
model.component('comp1').variable('var1').set('Q_m', 'k_0^2*(r^2+(z+h_s)^2)');

model.component('comp1').physics('emw').prop('components').set('components', 'inplane');
model.component('comp1').physics('emw').prop('BackgroundField').set('SolveFor', 'scatteredField');
model.component('comp1').physics('emw').prop('BackgroundField').set('Eb', {'E_a*k_0^2*r*((z-h_s)*Vreg(Q_p)+(z+h_s)*Vreg(Q_m))/2' '0' 'E_a*(2*Ureg(Q_p)+2*Ureg(Q_m)-k_0^2*r^2*(Vreg(Q_p)+Vreg(Q_m)))/2'});

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'1'});
model.component('comp1').material('mat1').propertyGroup('def').set('relpermeability', {'1'});
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'0'});
model.component('comp1').material('mat1').label('Air');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat2').label('Sphere');
model.component('comp1').material('mat1').selection.set([1 3]);
model.component('comp1').material('mat2').selection.set([2]);
model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'eps_r-i*eps_i'});
model.component('comp1').material('mat2').propertyGroup('def').set('relpermeability', {'1'});
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'0'});

model.component('comp1').coordSystem.create('pml1', 'PML');
model.component('comp1').coordSystem('pml1').set('PMLfactor', '1.5');
model.component('comp1').coordSystem('pml1').selection.set([3]);

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');
model.study('std1').feature('freq').set('solnum', 'auto');
model.study('std1').feature('freq').set('notsolnum', 'auto');
model.study('std1').feature('freq').set('outputmap', {});
model.study('std1').feature('freq').set('ngenAUX', '1');
model.study('std1').feature('freq').set('goalngenAUX', '1');

model.study('std1').feature('freq').setSolveFor('/physics/emw', true);
model.study('std1').feature('freq').set('plist', 'f_0');
model.study('std1').feature('freq').set('punit', 'Hz');

model.component('comp1').mesh('mesh1').autoMeshSize(1);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').cpl.create('intop1', 'Integration');
model.component('comp1').cpl('intop1').set('axisym', true);
model.component('comp1').cpl('intop1').set('opname', 'intSheet');
model.component('comp1').cpl('intop1').selection.geom('geom1', 1);
model.component('comp1').cpl('intop1').selection.set([8 9]);
model.component('comp1').cpl('intop1').set('intorder', 30);


model.sol.create('sol1');


model.component('comp1').variable('var1').set('E_t', '((z-h_s)/R_s)*emw.Er-(r/R_s)*emw.Ez');

model.component('comp1').physics('emw').create('scu1', 'SurfaceCurrent', 1);
model.component('comp1').physics('emw').feature('scu1').selection.set([8 9]);
model.component('comp1').physics('emw').feature('scu1').set('Js0', {'sig*((z-h_s)/R_s)*E_t' '0' '-sig*(r/R_s)*E_t'});


model.sol('sol1').study('std1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').set('stol', 0.01);
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'f_0'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'no');
model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
% model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('linpmethod', 'sol');
model.sol('sol1').feature('s1').set('linpsol', 'zero');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', false);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').label('Suggested Direct Solver (emw)');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

%%
model.result.table.create('tbl1', 'Table');
model.result.numerical.create('gev1', 'EvalGlobal');

model.result.numerical('gev1').set('data', 'dset1');
model.result.numerical('gev1').set('expr', ...
    {'0.5*real(sig)*comp1.intSheet(abs(comp1.E_t)^2)/P_in'});
model.result.numerical('gev1').set('descr', {'Absorpbtion'});
model.result.numerical('gev1').set('unit', {'1'});
model.result.numerical('gev1').set('tablecols', 'data');
model.result.numerical('gev1').set('table', 'tbl1');

model.result.numerical('gev1').setResult;

str1 = mphtable(model, 'tbl1');
Absorpbtion = str1.data(:, end);

%% Optimization

% Read and freeze the current sphere radius
R_s = model.param.evaluate('R_s', 'm');
Z_0 = model.param.evaluate('Z_0', 'ohm');

k_plus = 0.5;
lambda = 2*pi*R_s/k_plus;

model.param.set('R_s', sprintf('%.17g[m]', R_s));
model.param.set('lambda_0', sprintf('%.17g[m]', lambda));

% Sphere-center heights to investigate
h_over_lambda = 0.10:0.2:2;
N_h = length(h_over_lambda);

assert(all(h_over_lambda > k_plus/(2*pi)), ...
    'The sphere center must satisfy h > R_s.');

costFunc = @(param) find_abs(param, model);

N_start = 10;

sigma_init = zeros(N_h, 2, N_start);

sigma_current = zeros(N_h, 2, N_start);

MinInOptimization = zeros(N_h, N_start);

for i = 1:N_start

  sigma_init(:, :, i) = [0.03 + 0.37*rand(N_h, 1), -1.6 + 0.7*rand(N_h, 1)];

end



options = optimoptions(@fmincon, ...
    'Algorithm', 'sqp', ...
    'Display', 'iter', ...
    'FiniteDifferenceStepSize', 1e-4, ...
    'FiniteDifferenceType', 'central', ...
    'OptimalityTolerance', 1e-6, ...
    'MaxIterations', 500, ...
    'MaxFunctionEvaluations', 10000);

lb = [0, -Inf];       % Real part >= 0; imaginary part unrestricted
ub = [Inf, Inf];


for i = 1:N_h

    model.param.set('h_s', ...
        sprintf('%.17g[m]', h_over_lambda(i)*lambda));

    % Rebuild once per height
    model.component('comp1').geom('geom1').run;
    model.component('comp1').mesh('mesh1').run;

    for j = 1:N_start

        [sigma_current(i, :, j), fval, exitflag, output] = fmincon(costFunc, sigma_init(i, :, j),[], [], [], [], lb, ub, [], options);

        MinInOptimization(i, j) = fval;

    end
end


%%
value_vec = zeros(N_h, 1);
ind = zeros(N_h, 1);
g_opt = complex(zeros(N_h, 1));
sigma_opt = complex(zeros(N_h, 1));
Absorpbtion = zeros(N_h, 1);

for i = 1:N_h

    [value_vec(i), ind(i)] = min(MinInOptimization(i, :));

    g_opt(i) = sigma_current(i, 1, ind(i)) ...
         + 1i*sigma_current(i, 2, ind(i));

    sigma_opt(i) = g_opt(i)/Z_0;
    Absorpbtion(i) = -value_vec(i);

end

% Leave COMSOL at the winning conductivity for the last height
Absorpbtion(end) = ...
    -find_abs(sigma_current(end, :, ind(end)), model);


%%
plot(h_over_lambda, Z_0*real(sigma_opt), 'o')


xlabel('$h/\lambda$', Interpreter='latex', FontSize= 22)
ylabel('$\sigma_{cpa}$', Interpreter='latex', FontSize= 22)
title([''], Interpreter='latex', FontSize= 22)

% nanohub.org

%c = colorbar

set(gca, 'FontSize', 22);

ax1 = gca;
ax1.LineWidth = 1.5;

ax1.TickLabelInterpreter = 'latex';

%% Plots and comparison with the analytical model
% 
% 
% k_plus = 0.5;
% eps_c = model.param.evaluate('eps_r');
% Z_0 = model.param.evaluate('Z_0', 'ohm');
% 
% % Numerical optimization results
% h_num = h_over_lambda(:);
% g_num = Z_0*sigma_opt(:);
% 
% assert(numel(h_num) == numel(g_num), ...
%     'Each height must have one optimized conductivity.');
% 
% % Dense height grid for the analytical curve
% h_analytic = linspace(min(h_num), max(h_num), 400).';
% eta = 2*pi*h_analytic;                    % eta = k_0*h
% 
% %% Analytical PEC-coupled dipole condition
% % All expressions use COMSOL's exp(+i*omega*t) convention.
% 
% t = 2*eta;
% I = 1/3 + (sin(t) - t.*cos(t))./t.^3;
% 
% G = exp(-2i*eta).*(1 + 2i*eta)./(16*pi*eta.^3);
% 
% beta = 1./(G + 1i*I/pi);                 % beta = k_0^3*alpha
% S1_target = 1 - 1i*beta/(3*pi);
% 
% %% Convert target dipole response into coating conductivity
% 
% x = k_plus;
% n = sqrt(eps_c);
% y = n*x;
% 
% % Spherical Bessel function j_1(y)
% j1 = sin(y)/y^2 - cos(y)/y;
% 
% % Dj = (1/y)*d[y*j_1(y)]/dy
% Dj = sin(y)/y - j1/y;
% 
% % Incoming and outgoing spherical Hankel functions at x
% h_in  = -exp(1i*x)*(1 + 1i/x)/x;
% h_out = conj(h_in);
% 
% % D = (1/x)*d[x*h_1(x)]/dx
% D_in  = -1i*exp(1i*x)/x - h_in/x;
% D_out = conj(D_in);
% 
% g_analytic = 1i*( ...
%     (h_in + S1_target*h_out)./(D_in + S1_target*D_out) ...
%     - n*j1/Dj);
% 
% sigma_analytic = g_analytic/Z_0;           % Conductivity in siemens
% 
% %% Plot normalized conductivity: g = Z_0*sigma
% 
% figure('Color', 'w');
% 
% subplot(1,2,1)
% plot(h_analytic, real(g_analytic), 'b-', 'LineWidth', 1.8);
% hold on
% plot(h_num, real(g_num), 'ro', ...
%     'MarkerSize', 7, 'LineWidth', 1.5);
% xlabel('h/\lambda');
% ylabel('Re(Z_0\sigma)');
% legend('Analytical dipole model', 'COMSOL optimization', ...
%     'Location', 'best');
% grid on
% box on
% 
% subplot(1,2,2)
% plot(h_analytic, imag(g_analytic), 'b-', 'LineWidth', 1.8);
% hold on
% plot(h_num, imag(g_num), 'ro', ...
%     'MarkerSize', 7, 'LineWidth', 1.5);
% xlabel('h/\lambda');
% ylabel('Im(Z_0\sigma)');
% legend('Analytical dipole model', 'COMSOL optimization', ...
%     'Location', 'best');
% grid on
% box on
% 
% 
% 
% 
