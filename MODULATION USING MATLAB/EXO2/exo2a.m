% Définition de la réponse impulsionnelle h[n]
%Comme dans la question nous definissons la reponse impulsionnelle
%h[n]=[-0.5]^(n) u[n]

n_h = 0:10;
h = (-0.5).^n_h .* (n_h >= 0);

% Impulsions unitaires δ[n], δ[n-1], δ[n-2]
%definir chaque dirac avec son decalage respectif


delta_0 = [1 zeros(1, length(n_h)-1)];
delta_1 = [0 1 zeros(1, length(n_h)-2)];
delta_2 = [0 0 1 zeros(1, length(n_h)-3)];

%----------Base therorique pour calculer la sortie--------------

%{
Pour calculer la sortie y, nous allons exploiter les propriétés du système LTI, à savoir l’invariance dans le temps et la linéarité.
Commençons d’abord par la définition de la réponse impulsionnelle d’un système LTI.
La réponse impulsionnelle d’un système LTI est la réponse du système lorsque l’entrée est une impulsion de Dirac.
Dans notre cas, l’entrée est la somme de trois impulsions de Dirac, et par linéarité, chaque impulsion de Dirac aura une réponse impulsionnelle en sortie.
Le décalage temporel de chaque réponse impulsionnelle sera identique à celui de l’impulsion de Dirac à l’entrée, car le système est invariant dans le temps. 
En conséquence, la sortie sera la somme des réponses impulsionnelles correspondant à chaque impulsion de Dirac à l’entrée.

%}



% Calcul de la sortie y[n] par somme des réponses impulsionnelles
y = h + circshift(h, 1) + circshift(h, 2);

% Affichage des réponses impulsionnelles individuelles
figure;
subplot(3,1,1);
stem(n_h, h);
xlabel('n');
ylabel('h[n]');
title('Réponse impulsionnelle pour δ[n]');

subplot(3,1,2);
stem(n_h, circshift(h, 1));
xlabel('n');
ylabel('h[n-1]');
title('Réponse impulsionnelle pour δ[n-1]');

subplot(3,1,3);
stem(n_h, circshift(h, 2));
xlabel('n');
ylabel('h[n-2]');
title('Réponse impulsionnelle pour δ[n-2]');

% Affichage de la sortie y[n]
figure;
stem(n_h, y);
xlabel('n');
ylabel('y[n]');
title('Sortie y[n]');

























