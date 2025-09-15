% signals.m  
% Generates five classic signals in one figure (impulse, step, ramp, exponential, signum)
% and a separate figure for sinc(t) = sin(t)/t (non-normalized).

close all; clear; clc;

% Common time axis to match the screenshots
t = -10:0.01:10;

% ----- 1) Unit Impulse (visual as a single spike at t=0) -----------------
impulse = (t==0);   % purely for plotting with stem (not a numerical Dirac)

% ----- 2) Unit Step ------------------------------------------------------
u = double(t >= 0);

% ----- 3) Unit Ramp ------------------------------------------------------
r = t .* (t >= 0);

% ----- 4) Exponential (no step multiplier; defined for all t) ------------
x_exp = exp(-0.2*t);    % decays as t increases; grows as t decreases

% ----- 5) Signum ---------------------------------------------------------
sg = sign(t);           % -1 for t<0, 0 at 0, +1 for t>0

% ---------------- Figure 1: five subplots (layout 3x2) -------------------
f1 = figure('Position',[100 100 1000 700]);
tiledlayout(3,2,'TileSpacing','compact','Padding','compact');

% a) Impulse
nexttile;
stem(t, impulse, 'filled','LineWidth',1.2); grid on;
xlim([-10 10]); ylim([0 1.1]);
title('Continuous time unit impulse signal');
xlabel('continuous time t ---->'); ylabel('amplitude ---->');

% b) Step
nexttile;
plot(t, u, 'LineWidth',1.5); grid on;
xlim([-10 10]); ylim([-0.1 1.1]);
title('Unit step signal');
xlabel('continuous time t ---->'); ylabel('amplitude ---->');

% c) Ramp
nexttile;
plot(t, r, 'LineWidth',1.5); grid on;
xlim([-10 10]);
ylim([0 max(r)+0.5]);
title('Unit ramp signal');
xlabel('continuous time t ---->'); ylabel('amplitude ---->');

% d) Exponential
nexttile;
plot(t, x_exp, 'LineWidth',1.5); grid on;
xlim([-10 10]);
ylim([0 max(x_exp)+0.5]);
title('continuous time exponential signal');
xlabel('continuous time t ---->'); ylabel('amplitude ---->');

% e) Signum
nexttile([1 2]);  % full width bottom row like in screenshot
plot(t, sg, 'LineWidth',1.5); grid on;
xlim([-10 10]); ylim([-1.1 1.1]);
title('continuous time signum function');
xlabel('continuous time t ---->'); ylabel('amplitude ---->');

% ---------------- Figure 2: sinc(t) = sin(t)/t ---------------------------
f2 = figure('Position',[120 120 950 600]);
x_sinc = sin(t)./t; x_sinc(t==0) = 1;  % define value at 0
plot(t, x_sinc, 'LineWidth',1.5); grid on;
xlim([-10 10]);
title('continuous time sinc function');
xlabel('continuous time t ---->'); ylabel('amplitude ---->');

% Save like the screenshots (optional)
outdir = fullfile(pwd,'figures'); if ~exist(outdir,'dir'), mkdir(outdir); end
exportgraphics(f1, fullfile(outdir,'Figure1_signals.png'), 'Resolution', 200);
exportgraphics(f2, fullfile(outdir,'Figure2_sinc.png'),     'Resolution', 200);

disp('Done. Two figures saved under ./figures as Figure1_signals.png and Figure2_sinc.png');
