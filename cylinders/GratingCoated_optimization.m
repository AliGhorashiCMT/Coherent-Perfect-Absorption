global model;

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('/Users/ali/Desktop/Research Projects');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').physics.create('ewfd', 'ElectromagneticWavesFrequencyDomain', 'geom1');

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');
model.study('std1').feature('freq').set('solnum', 'auto');
model.study('std1').feature('freq').set('notsolnum', 'auto');
model.study('std1').feature('freq').set('outputmap', {});
model.study('std1').feature('freq').set('ngenAUX', '1');
model.study('std1').feature('freq').set('goalngenAUX', '1');
model.study('std1').feature('freq').set('ngenAUX', '1');
model.study('std1').feature('freq').set('goalngenAUX', '1');

model.study('std1').feature('freq').setSolveFor('/physics/ewfd', true);

model.param.set('R', '1 [m]');
model.param.set('lambda', '8*pi*R');
model.param.set('period', 'lambda/2');


model.param.set('sigma', '(0.036-0.51j)*c_const*epsilon0_const');



%%
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('size', {'period' '1'});
model.component('comp1').geom('geom1').feature('r1').set('base', 'center');
model.component('comp1').geom('geom1').feature('r1').set('size', {'period' '3*lambda'});
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').create('c1', 'Circle');
model.component('comp1').geom('geom1').feature('c1').set('r', 'R');
model.component('comp1').geom('geom1').run;
%%
model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive_index');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('n', {'1'});

model.component('comp1').physics('ewfd').prop('components').set('components', 'inplane');
model.component('comp1').physics('ewfd').create('scu1', 'SurfaceCurrent', 1);
model.component('comp1').physics('ewfd').feature('scu1').selection.set([5 6 7 8]);
model.component('comp1').physics('ewfd').feature('scu1').set('Js0', {'sigma/R^2 * (y^2*ewfd.Ex  - x*y*ewfd.Ey)' 'sigma/R^2 * (x^2*ewfd.Ey  - x*y* ewfd.Ex)' '0'});
model.component('comp1').physics('ewfd').create('pc1', 'PeriodicCondition', 1);
model.component('comp1').physics('ewfd').feature('pc1').selection.set([1 4]);

model.component('comp1').physics('ewfd').create('port1', 'Port', 1);
model.component('comp1').physics('ewfd').feature('port1').selection.set([3]);
model.component('comp1').physics('ewfd').feature('port1').set('PortType', 'Rectangular');
model.component('comp1').physics('ewfd').feature('port1').set('PortModeType', 'TEM');

model.component('comp1').physics('ewfd').create('port2', 'Port', 1);
model.component('comp1').physics('ewfd').feature('port2').selection.set([2]);
model.component('comp1').physics('ewfd').feature('port2').set('PortType', 'Rectangular');
model.component('comp1').physics('ewfd').feature('port2').set('PortModeType', 'TEM');

model.study('std1').feature('freq').set('plist', 'c_const/lambda');



%%
model.component('comp1').mesh('mesh1').autoMeshSize(1);
model.component('comp1').mesh('mesh1').run;


%%
model.sol.create('sol1');
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
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c_const/lambda'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'THz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'no');
model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'Default');
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
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'mumps');
model.sol('sol1').feature('s1').feature('d1').label('Suggested Direct Solver (ewfd)');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;


%%
model.component('comp1').physics('ewfd').feature('port1').set('PortExcitation', 'on');
model.component('comp1').physics('ewfd').feature('port2').set('PortExcitation', 'off');

model.result.numerical.create('gev1', 'EvalGlobal');
model.result.numerical('gev1').label('Scattering 1 (ewfd)');
%model.result.numerical('gev1').set('data', 'dset1');
model.result.numerical('gev1').set('expr', {'ewfd.S11', 'ewfd.S21'}); 
model.result.table.create('tbl1', 'Table');
model.result.numerical('gev1').set('table', 'tbl1');

model.sol('sol1').runAll;
model.result.numerical('gev1').setResult;

%%


R = 1;


k_p = (0.01:0.1:1)*R; % k_+

lambda = 2*pi./k_p;

costFunc = @findS;

N_freq = length(lambda);


N_start = 10;

sigma_init = zeros(N_freq, 2, N_start);

sigma_current = zeros(N_freq, 2, N_start);

MinInOptimization = zeros(N_freq, N_start);

for i = 1:N_start

    sigma_init(:, :, i) = [rand(N_freq, 1), 2*rand(N_freq, 1)];

end



options = optimoptions(@fminunc,'Display','iter', 'FiniteDifferenceStepSize', 0.0001,'FiniteDifferenceType','central', 'OptimalityTolerance', 10^-10, 'MaxIterations', 500, 'MaxFunctionEvaluations', 10000);



for i = 1:N_freq
    model.param.set('lambda', sprintf('%.17g[m]', lambda(i)));
    
    for j = 1:N_start
    

    [sigma_current(i, :, j),fval,exitflag,output] = fminunc(costFunc,sigma_init(i, :, j), options);
    MinInOptimization(i, j) = fval;

    end 
end



%%
value_vec = zeros(N_freq, 1);
ind = zeros(N_freq, 1);
sigma_cpa = zeros(N_freq, 1);

for i = 1:N_freq
    [value_vec(i), ind(i)] = min(MinInOptimization(i, :));
    sigma_cpa(i) = sigma_current(i, 1, ind(i)) + 1j*sigma_current(i, 2, ind(i));
end


%%
plot(k_p, real(sigma_cpa), '-o', 'DisplayName', 'Re\{$\sigma_{cpa}$\}', 'LineWidth', 3)
hold on
plot(k_p, imag(sigma_cpa), '-o', 'DisplayName', 'Im\{$\sigma_{cpa}$\}', 'LineWidth', 3)

xlabel('$k^+$', Interpreter='latex', FontSize= 22)

title('Conductivity ', Interpreter='latex', FontSize= 22)
legend('Location','best', Interpreter= 'latex', FontSize=21);


%%
plot(k_p, value_vec, '-.', 'DisplayName', 'Re{$\sigma_cpa$}', 'LineWidth', 3)


%% Check step size
% p = [0.036, 0.51];
% hs = [1e-3, 1e-4, 1e-5, 1e-6, 1e-7];
% G = zeros(numel(hs),2);
% 
% for n = 1:numel(hs)
%     for j = 1:2
%         d = zeros(1,2);
%         d(j) = hs(n);
% 
%         G(n,j) = (findS(p+d)-findS(p-d))/(2*hs(n));
%     end
% end
% 
% findS(p);  % Restore the tested conductivity and solution
% 
% disp(array2table([hs(:),G], ...
%     'VariableNames',{'Step','dF_dp1','dF_dp2'}));
%%

% model.result.create('pg1', 'PlotGroup2D');
% model.result('pg1').label('Electric Field (ewfd)');
% model.result('pg1').set('frametype', 'spatial');
% model.result('pg1').set('defaultPlotID', 'ElectromagneticWavesFrequencyDomain/phys1/pdef1/pcond2/pg1');
% model.result('pg1').feature.create('surf1', 'Surface');
% model.result('pg1').feature('surf1').set('smooth', 'internal');
% model.result('pg1').feature('surf1').set('data', 'parent');
% model.result.numerical.create('gev1', 'EvalGlobal');
% model.result.numerical('gev1').label('Reflectance, Transmittance, and Absorptance (ewfd)');
% model.result.numerical('gev1').set('data', 'dset1');
% model.result.numerical('gev1').set('expr', {'ewfd.Rport_1' 'ewfd.Rtotal' 'ewfd.Tport_2' 'ewfd.Ttotal' 'ewfd.RTtotal' 'ewfd.Atotal'});
% model.result.table.create('tbl1', 'Table');
% model.result.numerical('gev1').set('table', 'tbl1');
% model.result.numerical('gev1').run;
% model.result.numerical('gev1').setResult;
% model.result('pg1').run;
