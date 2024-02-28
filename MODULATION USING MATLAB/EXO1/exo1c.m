% Définition des valeurs de a et w
%Pour cette question nous devons faire varier a pour
%voir son impact sur le signal
a_values = [1, 2, 3, 4, 5, 6]; %Valeur de a allant de 1 a 6
omega_values = [10, 20]; %valeur de w  [10,20].

% Définition du domaine temporel
t = linspace(-10, 10, 1000);

% Création d'une seule figure pour afficher tous les signaux
figure;

% Couleurs pour les différentes valeurs de a
colors = hsv(length(a_values));

% Tracé de m(t) pour chaque valeur de a
%nous allons utiliser une boucle pour un tracage rapide des ce signaux 
%chaque valeur de a sera recuperee suivant son index dans la liste de val
%de a et ensuite nous permettra de tracer la courbe.
for i = 1:length(a_values)
    a = a_values(i);
    
    % Calcul du signal m(t) pour la valeur de a actuelle
    m_t = exp(-a * abs(t));
    
    % Affichage du signal m(t)
    plot(t, m_t, 'LineWidth', 1.5, 'Color', colors(i,:));
    hold on;
    
    % Tracé de x(t) pour w = 10 pour la valeur de a actuelle
    x_t_w10 = cos(omega_values(1) * t) .* exp(-a * abs(t));
    plot(t, x_t_w10, '--', 'LineWidth', 1.5, 'Color', colors(i,:));
    
    % Tracé de x(t) pour w = 20 pour la valeur de a actuelle
    x_t_w20 = cos(omega_values(2) * t) .* exp(-a * abs(t));
    plot(t, x_t_w20, '-.', 'LineWidth', 1.5, 'Color', colors(i,:));
end

% Configuration de la figure
xlabel('t');
ylabel('Amplitude');
title('Signaux m(t) et x(t) pour différentes valeurs de a et de w');
grid on;
xlim([-10, 10]);

%{
---------------------interpretation des resulats--------------

À mesure que la valeur de a augmente, l'amplitude du signal diminue. 
Cela est dû au fait que le terme exp(-a(abs(t))décrit une décroissance 
exponentielle du signal en fonction du temps. plus a est grand , plus le signal décroît rapidement.
en termes d'energie Cela signifie que le signal perd son énergie plus
rapidement au fur et à mesure que a augmente
Bien que a n'affecte pas directement la fréquence du signal, 
il influence indirectement la bande passante effective du signal modulé
x(t) , Une valeur plus élevée de a réduit l'amplitude du signal, 
ce qui peut entraîner une diminution de la plage de fréquences significatives dans le signal modulé
%}

% Dans cette version, la légende n'a pas été incluse dans le graphique afin de ne pas alourdir 
% la visualisation et de permettre une meilleure compréhension des signaux tracés. Merci de votre compréhension Monsieur.



