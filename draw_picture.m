clear;

% Define the dielectric constants for the materials
eps_A = 7.253701208520992 + 2.855178298595981i;  % Complex dielectric constant for material A
eps_B = 1.780117465713234 + 0.000472723782000i;    % Complex dielectric constant for material B
eps_C = 1;         % Real dielectric constant for material C

% Define the volume fractions of the materials
f_A_range = linspace(0, 1, 200); % More points for smoother plot
f_B_range = linspace(0, 1, 200); % More points for smoother plot
E_eff = zeros(length(f_A_range), length(f_B_range));  % Preallocate matrix for efficiency

% Loop over possible values of f_A and f_B
for i = 1:length(f_A_range)
    for j = 1:length(f_B_range)
        f_A = f_A_range(i);
        f_B = f_B_range(j);
        f_C = 1 - f_A - f_B;  % Calculate f_C so that f_A + f_B + f_C = 1
        
        % Ensure that the volume fractions are valid
        if f_C >= 0
            % Calculate the effective dielectric constant using your function PS3
            eps_eff = PS3(eps_A, eps_B, eps_C, f_A, f_B, f_C);
            E_eff(i, j) = eps_eff;
        else
            E_eff(i, j) = NaN;  % Assign NaN for invalid combinations
        end
    end
end

% Plot the real part of the effective dielectric constant using imagesc
figure (1);
imagesc(f_A_range, f_B_range, real(E_eff'));
xlabel('含水量(%)');
ylabel('含冰量(%)');
% title('Effect of f_A and f_B on Effective Dielectric Constant');
colorbar;  % Show the color bar
axis xy;    % Correct the axis orientation
axis tight; % Fit the axis tightly to the data
shading interp; % Interpolate colors for a smoother appearance
set(get(gca,'children'), 'alphadata', ~isnan(real(E_eff')));


figure (2);
imagesc(f_A_range, f_B_range, -imag(E_eff'));
xlabel('含水量(%)');
ylabel('含冰量(%)');
% title('Effect of f_A and f_B on Effective Dielectric Constant');
colorbar;  % Show the color bar
axis xy;    % Correct the axis orientation
axis tight; % Fit the axis tightly to the data
shading interp; % Interpolate colors for a smoother appearance
set(get(gca,'children'), 'alphadata', ~isnan(real(E_eff')));



% Loop over possible values of f_A and f_B
for i = 1:length(f_A_range)
    for j = 1:length(f_B_range)
        f_A = f_A_range(i);
        f_B = f_B_range(j);
        f_C = 1 - f_A - f_B;  % Calculate f_C so that f_A + f_B + f_C = 1
        
        % Ensure that the volume fractions are valid
        if f_C >= 0
            % Calculate the effective dielectric constant using your function PS3
            eps_eff = mg_refractive([eps_A, eps_B, eps_C], [f_A, f_B, f_C]);
            E_eff(i, j) = eps_eff;
        else
            E_eff(i, j) = NaN;  % Assign NaN for invalid combinations
        end
    end
end

% Plot the real part of the effective dielectric constant using imagesc
figure (3);
imagesc(f_A_range, f_B_range, real(E_eff'));
xlabel('含水量(%)');
ylabel('含冰量(%)');
% title('Effect of f_A and f_B on Effective Dielectric Constant');
colorbar;  % Show the color bar
axis xy;    % Correct the axis orientation
axis tight; % Fit the axis tightly to the data
shading interp; % Interpolate colors for a smoother appearance
set(get(gca,'children'), 'alphadata', ~isnan(real(E_eff')));


figure (4);
imagesc(f_A_range, f_B_range, -imag(E_eff'));
xlabel('含水量(%)');
ylabel('含冰量(%)');
% title('Effect of f_A and f_B on Effective Dielectric Constant');
colorbar;  % Show the color bar
axis xy;    % Correct the axis orientation
axis tight; % Fit the axis tightly to the data
shading interp; % Interpolate colors for a smoother appearance
set(get(gca,'children'), 'alphadata', ~isnan(real(E_eff')));
