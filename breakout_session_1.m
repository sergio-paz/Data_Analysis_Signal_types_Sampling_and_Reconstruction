clc; clear all; close all;

% Define the interval
t_min = 0;
t_max = 2*pi;

%% Continuous (Symbolic) Representation
syms t
f_sym = sin(t);
df_sym = diff(f_sym, t); % Derivative of sin(t)

% Plot symbolic function
figure
fplot(f_sym, [t_min t_max], 'LineWidth', 2)
hold on
fplot(df_sym, [t_min t_max], '--r', 'LineWidth', 2)
title('Continuous Representation: f(t) and df/dt')
xlabel('t')
ylabel('Value')
legend('f(t) = sin(t)', 'df/dt = cos(t)')
grid on

%% Discrete Representation
N = 5; % Number of sample points
t_discrete = linspace(t_min, t_max, N);
f_discrete = sin(t_discrete);
df_discrete = cos(t_discrete); % Derivative of sin(t) is cos(t)

% Plot discrete points
figure
plot(t_discrete, f_discrete, 'bo', 'MarkerSize', 4)
hold on
plot(t_discrete, df_discrete, 'rx', 'MarkerSize', 4)
title('Discrete Representation: f(t) and df/dt')
xlabel('t')
ylabel('Value')
legend('f(t) = sin(t)', 'df/dt = cos(t)')
grid on

%% Both Representations
figure
fplot(f_sym, [t_min t_max], '-', 'Color', [68/255 166/255 198/255], 'LineWidth', 2)
hold on
fplot(df_sym, [t_min t_max], '--', 'Color', [255/255 39/255 39/255], 'LineWidth', 2)
hold on
plot(t_discrete, f_discrete, '--o', 'Color', [173/255 216/255 230/255], 'MarkerSize', 6, 'LineWidth', 1.4)
hold on
plot(t_discrete, df_discrete, '--o', 'Color', [255/255 137/255 137/255], 'MarkerSize', 6, 'LineWidth', 1.4)
title('f(t) and df/dt')
xlabel('t')
ylabel('Value')
legend('f(t) cont', 'df/dt cont', 'f(t) disc', 'df/dt disc', 'Location', 'Best')
grid on