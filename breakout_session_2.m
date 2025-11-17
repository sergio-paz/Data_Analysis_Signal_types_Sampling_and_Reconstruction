clc; clear all; close all;

% Reconstructing a sinusoidal sample using polynomial fitting
% and observing behavior inside and outside the interval

% Original interval
t_min = 0;
t_max = 2*pi;

% Discretization
N = 20; % Number of sample points
t_discrete = linspace(t_min, t_max, N);
f_discrete = sin(t_discrete);

% Extended interval for evaluation
t_extended = linspace(0, 4*pi, 200);

% Polynomial orders to test
orders = [3, 5, 10, 20];

for i = 1:length(orders)
    n = orders(i);
    
    % Polynomial fitting
    p = polyfit(t_discrete, f_discrete, n);
    f_fit = polyval(p, t_extended);
    
    % Plot for each order
    figure
    plot(t_extended, sin(t_extended), 'k-', 'LineWidth', 1.5) % Original sine
    hold on
    plot(t_extended, f_fit, 'r--', 'LineWidth', 1.5)          % Polynomial fit
    plot(t_discrete, f_discrete, 'bo', 'MarkerSize', 4)       % Sample points
    title(['Polynomial Fit of sin(t), Order = ', num2str(n)])
    xlabel('t')
    ylabel('Value')
    legend('Original sin(t)', 'Polynomial Fit', 'Samples')
    grid on
    ylim([-5 5])
end