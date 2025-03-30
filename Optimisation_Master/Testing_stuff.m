clear
clc
close all

%Joint Space Sampling
N = 30*1e6;

%Home Vector:
q_home = [deg2rad(-39.5967) deg2rad(-77.9160)]; % right home position

%Raven Joints: Lower Upper
qrxL = q_home(1) - 0;%pi/4; 
qrxU = q_home(1) + pi/4; 
qryL = q_home(2) - 0;%pi/4;
qryU = q_home(2) + pi/4;
qrzL = 0; 
qrzU = ceil(sqrt(50^2+4^2))+1; 

%Raven Joint space:
qrx_space = linspace(qrxL,qrxU, ceil(rad2deg((qrxU-qrxL)))); disp(['qrx : ', num2str(length(qrx_space))])
qry_space = linspace(qryL,qryU, ceil(rad2deg((qryU-qryL)))); disp(['qry : ', num2str(length(qry_space))])
qrz_space = linspace(qrzL,qrzU, qrzU-qrzL);  disp(['qrz : ', num2str(length(qrz_space))])

segments = 1;

%Continuum Joints: Lower Upper
theta_max = (9/3)/2 ; %(design.alpha(ii)*design.n(ii))/2; %Maximum bending
%pan
qipL = -theta_max; qipU = theta_max;
%tilt
qitL = -theta_max; qitU = theta_max;
%Sample configuration space, pan and tilt joints:
qip_space = linspace(qipL,qipU, ceil(rad2deg(theta_max*2))); disp(['qip : ', num2str(length(qip_space))])
qit_space = linspace(qitL,qitU, ceil(rad2deg(theta_max*2))); disp(['qit : ', num2str(length(qit_space))])

% Size

S = length(qrx_space)*length(qry_space)*length(qrz_space)*length(qip_space)*length(qit_space);

%%
% SAMPLING ALL ALPHA COMBOS
poolobj = parpool('local',[2 30],'SpmdEnabled',false,'IdleTimeout',60);
disp(poolobj)

Q = zeros(S,5);
% alpha_space = linspace(0.01,90, n);
qip = []; qit = [];
qrx = []; qry = [];  qrz = [];

parfor a = 1:length(qrx_space)
    tic
    for b = 1:length(qrx_space)
        for c = 1:length(qrz_space)
            for d = 1:length(qip_space)
                for e = 1:length(qit_space)
                    % qrx = [qrx; qrx_space(a)];
                    % qry = [qry; qry_space(b)];
                    % qrz = [qrz; qrz_space(c)];
                    % qip = [qip; qip_space(d)];
                    % qit = [qit; qit_space(e)];
                    Q = [Q; qrx_space(a), qry_space(b), qrz_space(c), qip_space(d), qit_space(e) ]
                end
            end
        end
    end
    toc;
    disp(toc)
end

%Append segment configurations to whole configuration space:
% Q = [qrx, qry, qrz, qip, qit];
size(Q)

save(Q_combos, 'Q')


delete(poolobj)
