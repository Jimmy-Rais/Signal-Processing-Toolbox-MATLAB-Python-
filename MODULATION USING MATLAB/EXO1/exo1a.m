% Initialistaion des parametres 
omega_values = [10, 20]; % Différentes valeurs de omega en occurance 10,20

% Définition de la fonction m(t) , cette fonction est le message 
t = linspace(-10, 10, 1000); % Plage de temps de -10 a 10 avec un pas de 1000
m_t = exp(-abs(t)); % Fonction m(t) 

% Calcul de la transformée de Fourier de m(t)
M_jw = fftshift(fft(m_t)); %la fonction fftshift est utilisee 
%pour centre le signal trouve' sur 0.

% Affichage du signal message m(t) et sa transformée de Fourier
%on affiche le message et sa transformee de fourier 
figure; %initialiser une page de figure propre pour l'affichage de resultats.
subplot(2, 1, 1); 
plot(t, m_t);
xlabel('t');
ylabel('m(t)');
title('Signal message m(t)');

subplot(2, 1, 2); %Afficher la transformee en dessus du signal message
plot(t, abs(M_jw));
xlabel('\omega');
ylabel('|M(j\omega)|');
title('Transformée de Fourier M(j\omega) du signal message');

% Affichage du signal modulé x(t) et sa transformée de Fourier pour chaque valeur de omega
for omega = omega_values
    x_t = cos(omega * t) .* m_t; % Signal modulé x(t)
    X_jw = abs(fftshift(fft(x_t))); % Transformée de Fourier de x(t)
    
    % Affichage du signal modulé x(t)
    figure;
    subplot(2, 1, 1);
    plot(t, x_t);
    xlabel('t');
    ylabel('x(t)');
    title(['Signal modulé x(t) pour \omega = ', num2str(omega)]);
    
    % Affichage de la transformée de Fourier de x(t)
    subplot(2, 1, 2);
    plot(t, X_jw);
    xlabel('\omega');
    ylabel('|X(j\omega)|');
    title(['Transformée de Fourier X(j\omega) pour \omega = ', num2str(omega)]);
end

%--------------------------------%observation%----------------------


%------------------pour le message----------------------------------
%Le signal message m(t)est une fonction exponentielle 
% qui oscille autour de zéro lorsque t augmente.
% Comme prévu,sa fourier transform a  une amplitude décroissante
% à mesure que la fréquence augmente.


% ----------------pour le signal module'-------------------
% le signal module'est une combinaison du signal message  
% modulé par une onde porteuse cosinusoïdale.
% Lorsque la fréquence de la porteuse w augmente , la période de la modulation
% diminue et le signal semble être plus rapidement oscillant.
% Cela peut être observé dans le signal modulé.
% L'amplitude du signal modulé varie en fonction de m(t).