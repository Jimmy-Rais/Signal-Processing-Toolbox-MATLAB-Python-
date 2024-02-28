%Dans ce script, nous allons d'abord définir la réponse impulsionnelle.
%Par la suite, nous définirons l'entrée, puis nous calculerons le produit de convolution.

%--------------------%------------%---------------%-----------%

%Initialisation de la réponse impulsionnelle
n_h = 0:10; % Définir la plage de valeurs pour n
h = (-0.5).^n_h .* (n_h >= 0); % h[n] = (-0.5)^n * u[n]

% Définir l'entrée x[n]
n_x = 0:2; % Définir la plage de valeurs pour n
x = [1 1 1]; %Définir x[n] comme un signal composé de trois impulsions unitaires à n=0, n=1, et n=2.

% Calculer le produit de convolution de h[n] et x[n]
y = conv(h, x);
n_y = 0:length(y)-1; % Plage de valeurs pour n de y

% Tracer l'entrée x[n] sur la première figure
figure(1);
stem(n_x, x);
xlabel('n');
ylabel('x[n]');
title('Entrée x[n]');
ylim([-2 2]); % Définir l'échelle de l'axe y entre -2 et 2

% Tracer la réponse impulsionnelle h[n] sur la deuxième figure
figure(2);
stem(n_h, h);
xlabel('n');
ylabel('h[n]');
title('Réponse impulsionnelle h[n]');
ylim([-3 3]); % Définir l'échelle de l'axe y entre -2 et 2

% Tracer le produit de convolution de h[n] et x[n] sur la troisième figure
figure(3);
stem(n_y, y);
xlabel('n');
ylabel('y[n]');
title('Produit de convolution de h[n] et x[n]');
ylim([-3 3]); % Définir l'échelle de l'axe y entre -2 et 2

%{
Monsieur , pour plus de lisibilite de la courbe j'ai plote' l'entree sur
fig 1 , la sortie sur fig 2 et le produit de convolution sur fig 3
%}


