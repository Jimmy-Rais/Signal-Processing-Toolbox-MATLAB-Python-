% Définition des paramètres
omega_values = [10, 20]; % Différentes valeurs de omega

% Définition de la fonction m(t)
t = linspace(-10, 10, 1000); % Plage de temps
m_t = exp(-abs(t)); % Fonction m(t)

% Calcul de la transformée de Fourier de m(t)
M_jw = fftshift(fft(m_t));
amplitude_M_jw = abs(M_jw);
phase_M_jw = angle(M_jw);

% Création d'une seule figure pour afficher toutes les courbes
figure;

% Affichage du signal m(t) et ses spectres d'amplitude et de phase
subplot(3, 3, 1);
plot(t, m_t);
xlabel('t');
ylabel('m(t)');
title(' m(t)');

subplot(3, 3, 2);
plot(t, amplitude_M_jw);
xlabel('\omega');
ylabel('|M(j\omega)|');
title('SP AMP m(t)');

subplot(3, 3, 3);
plot(t, phase_M_jw);
xlabel('\omega');
ylabel('Phase(M(j\omega))');
title('SP PHS m(t)');

% Affichage du signal x(t) et ses spectres d'amplitude et de phase pour chaque valeur de omega

    x_ta = cos(10 * t) .* m_t; % Signal modulé x(t) pour w = 10.
    x_tb = cos(20 * t) .* m_t; % Signal modulé x(t) pour w = 20.

    
    % Calcul de la transformée de Fourier de x(t) w= 10 w=20 respectivement
    X_jwa = fftshift(fft(x_ta));
    X_jwb=fftshift(fft(x_tb));
    amplitude_X_jwa = abs(X_jwa);
    amplitude_X_jwb = abs(X_jwb);
    phase_X_jwa = angle(X_jwa);
    phase_X_jwb = angle(X_jwb);
    
    % Affichage du signal x(t) et ses spectres d'amplitude et de phase pour
    % w= 10
    subplot(3, 3, 4);
    plot(t, x_ta);
    xlabel('t');
    ylabel('x(ta)');
    title('x(ta) pour \omega = 10',10);
    
    subplot(3, 3, 5);
    plot(t, amplitude_X_jwa);
    xlabel('\omega');
    ylabel('|X(j\omega)|');
    title('SP ''AMP pour \omega = 10',10);

     subplot(3, 3, 6);
    plot(t, phase_X_jwa);
    xlabel('\omega');
    ylabel('Phase(X(j\omega))');
    title('SP PH pour \omega = 10',10);
     % Affichage du signal x(t) et ses spectres d'amplitude et de phase pour
    % w= 20
    subplot(3, 3, 7);
    plot(t, x_tb);
    xlabel('t');
    ylabel('x(tb)');
    title('x(ta) pour \omega = 20',20);
    
    subplot(3, 3, 8);
    plot(t, amplitude_X_jwb);
    xlabel('\omega');
    ylabel('|X(j\omega)|');
    title('SP ''AMP pour \omega = 20',20);

     subplot(3, 3, 9);
    plot(t, phase_X_jwb);
    xlabel('\omega');
    ylabel('Phase(X(j\omega))');
    title('SP PH pour \omega = 20',20);

%Commentaire pour cette question.

%voici le commentaire sur ces graphes obtenus:

%Le premier montre le signal m(t) montre une exponetielle décroissante.
% Le deuxième montre le spectre d'amplitude de m(t)  On peut observer que l'amplitude diminue 
% lorsque la fréquence augmente, avec un pic centré autour de zéro.
% Le troisième montre le spectre de phase de m(t) qui oscille autour de zéro.
% Le quatrième montre le signal x(t) pour w =10 dans le domaine temporel. Il est modulé
% par une fonction cosinus avec une fréquence de 10
% Le cinquième montre le spectre d'amplitude de x(t) pour w =1 20 On peut voir
% une amplification autour de w = 10 .
% Le sixième montre le spectre de phase de x(t) pour w = 10 montrant 
% la phase associée à chaque composante fréquentielle.
% Le septième montre le signal x(t) pour w = 20  dans le domaine temporel.
% Il est modulé par une fonction cosinus avec une fréquence de.
% Le huitième montre le spectre d'amplitude de x(t) pour w = 20 montrant
% une amplification autour de w = 20.
% Le neuvième montre le spectre de phase de x(t) pour w = 20 ,indiquant la phase associée à chaque composante fréquentielle.
%{
Le spectre d'amplitude pour m(t) montre une décroissance progressive de l'amplitude lorsque la fréquence augmente
Cela est dû au fait que m(t) est un signal dont la magnitude décroît exponentiellement avec le temps, ce qui se traduit 
par une répartition des fréquences plus faible à mesure que la fréquence
augmente.

Quant au spectre de phase pour m(t) l oscille autour de zéro. Cela signifie que 
les différentes composantes fréquentielles du signal m(t) sont toutes déphasées par
 des angles différents, mais leur moyenne est centrée autour de zéro.


%}