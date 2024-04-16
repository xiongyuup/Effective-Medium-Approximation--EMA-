function PS=MG3_byluo(eps_A,eps_B,eps_C,f_A,f_B,f_C)


% Define the function to solve
func = @(eps_eff) (f_A/(f_A+f_B)) * ((eps_C - eps_eff)*(eps_A + 2*eps_C) + (f_A + f_B)*(2 * eps_C + eps_eff)*(eps_A-eps_C) )/ ((eps_C + 2*eps_eff)*(eps_A + 2*eps_C) + ...
                  (f_A+f_B) * (2*eps_C - 2*eps_eff) *(eps_A - eps_C)) + ...
                  (f_B/(f_A+f_B)) * ((eps_C - eps_eff)*(eps_B + 2*eps_C) + (f_A + f_B)*(2 * eps_C + eps_eff)*(eps_B-eps_C) )/ ((eps_C + 2*eps_eff)*(eps_B + 2*eps_C) + ...
                  (f_A+f_B) * (2*eps_C - 2*eps_eff) *(eps_B - eps_C));

% Make an initial guess for eps_eff
eps_eff_guess = (f_A * eps_A + f_B * eps_B + f_C * eps_C) / (f_A + f_B + f_C);

% Use fsolve to solve the equation
options = optimoptions('fsolve', 'Display', 'iter');
[PS] = fsolve(func, eps_eff_guess, options);
end
% Check if the solution converged
% if exitflag <= 0
%     error('fsolve did not converge to a solution');
% end
