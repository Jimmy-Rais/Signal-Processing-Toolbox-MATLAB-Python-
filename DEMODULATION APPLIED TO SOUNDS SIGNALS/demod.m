% Display the welcome message
disp('==========================================================================');
disp('% Welcome to our audio modulation and demodulation laboratory.');
disp('% We are excited to have you in an environment dedicated to');
disp('% exploring advanced audio technologies. Explore the infinite possibilities');
disp('% of manipulating sound signals.');
disp('% .                  Dive into an immersive experience');
disp('% where sound comes to life and creativity knows no bounds.');
disp('==========================================================================');

% Ask the user to define the recording duration
recording_duration = input('Please enter the recording duration in seconds: ');

% Audio recording
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, recording_duration); % Record for the specified duration
disp('End of recording.');

% Playback of the recording
disp('Listen to your recording:');
play(recObj);
pause(recording_duration); % Pause to allow the user to listen

% If the user is not satisfied with the recording, return to the previous step
retry = true;
while retry
    prompt = 'Is the recording satisfactory? (Yes/No): ';
    response = input(prompt, 's');
    if strcmpi(response, 'No')
        disp('Please re-record your audio.');
        % Audio recording
        disp('Start speaking.')
        recordblocking(recObj, recording_duration); % Record for the specified duration
        disp('End of recording.');

        % Playback of the recording
        disp('Listen to your new recording:');
        play(recObj);
        pause(recording_duration); % Pause to allow the user to listen again
    elseif strcmpi(response, 'Yes')
        disp('Recording accepted.');
        retry = false;
        % Save the audio recording
        filename = 'recording.wav';
        audiowrite(filename, getaudiodata(recObj), recObj.SampleRate);

        % Load the audio recording
        [y, Fs] = audioread(filename);

        % Store the audio in the variable m(t)
        mt = y'; % Transpose to get a row vector

        % Calculation of the Fourier transform of the recorded audio signal
        MT_fft = fftshift(fft(mt));
        frequencies = linspace(-Fs/2, Fs/2, length(MT_fft));

        % Finding the maximum frequency
        [max_amplitude, max_index] = max(abs(MT_fft));
        fmax = abs(frequencies(max_index));

        % Choice of carrier frequencies
        % Carrier frequency 1 (lower than 2fmax)
        fp1 = fmax * 0.8;
        % Carrier frequency 2 (higher than 2fmax)
        fp2 = fmax * 2.2;

        % Calculation of modulation with carrier 1
        t = (0:length(mt)-1) / Fs; % Time vector
        modulation1 = mt .* cos(2*pi*fp1*t);

        % Calculation of modulation with carrier 2
        modulation2 = mt .* cos(2*pi*fp2*t);

        % Ask the user to listen to the sound of the signal to be modulated
        T1 = input('Type T1 to listen to the sound of the signal to be modulated: ', 's');
        if strcmpi(T1, 'T1')
            disp('Listen to the sound of the signal to be modulated:');
            sound(mt, Fs);
            pause(recording_duration);
        else
            disp('Invalid option. Please type T1 to listen to the sound of the signal to be modulated.');
        end

        % Ask the user to listen to the sound of the signal modulated with fp1
        T2 = input('Type T2 to listen to the signal modulated with carrier fp1: ', 's');
        if strcmpi(T2, 'T2')
            disp('Listen to the signal modulated with carrier fp1:');
            sound(modulation1, Fs);
            pause(recording_duration);
        else
            disp('Invalid option. Please type T2 to listen to the signal modulated with carrier fp1.');
        end

        % Ask the user to listen to the sound of the signal modulated with fp2
        T3 = input('Type T3 to listen to the signal modulated with carrier fp2: ', 's');
        if strcmpi(T3, 'T3')
            disp('Listen to the signal modulated with carrier fp2:');
            sound(modulation2, Fs);
            pause(recording_duration);
        else
            disp('Invalid option. Please type T3 to listen to the signal modulated with carrier fp2.');
        end

        % Demodulation of modulated signals
        demodulation1 = modulation1 .* cos(2*pi*fp1*t);
        demodulation2 = modulation2 .* cos(2*pi*fp2*t);

        % Ask the user to listen to the sound of the signal demodulated with fp1
        T4 = input('Type T4 to listen to the signal demodulated with carrier fp1: ', 's');
        if strcmpi(T4, 'T4')
            disp('Listen to the signal demodulated with carrier fp1:');
            sound(demodulation1, Fs);
            pause(recording_duration);
        else
            disp('Invalid option. Please type T4 to listen to the signal demodulated with carrier fp1.');
        end

        % Ask the user to listen to the sound of the signal demodulated with fp2
        T5 = input('Type T5 to listen to the signal demodulated with carrier fp2: ', 's');
        if strcmpi(T5, 'T5')
            disp('Listen to the signal demodulated with carrier fp2:');
            sound(demodulation2, Fs);
            pause(recording_duration);
        else
            disp('Invalid option. Please type T5 to listen to the signal demodulated with carrier fp2.');
        end

        % Calculation of the Fourier transforms of modulated and demodulated signals
        Modulation1_fft = fftshift(fft(modulation1));
        Modulation2_fft = fftshift(fft(modulation2));
        Demodulation1_fft = fftshift(fft(demodulation1));
        Demodulation2_fft = fftshift(fft(demodulation2));

        % Display signals and amplitude spectra
        figure;

        % First page of figures (time domain)
        subplot(5,2,1);
        plot(t, mt);
        title('Recorded audio signal');
        xlabel('Time (s)');
        ylabel('Amplitude');

        subplot(5,2,2);
        plot(t, modulation1, 'r');
        title('Modulation with carrier fp1');
        xlabel('Time (s)');
        ylabel('Amplitude');

        subplot(5,2,3);
        plot(t, modulation2, 'b');
        title('Modulation with carrier fp2');
        xlabel('Time (s)');
        ylabel('Amplitude');

        subplot(5,2,4);
        plot(t, demodulation1);
        title('Demodulation with carrier fp1');
        xlabel('Time (s)');
        ylabel('Amplitude');

        subplot(5,2,5);
        plot(t, demodulation2);
        title('Demodulation with carrier fp2');
        xlabel('Time (s)');
        ylabel('Amplitude');

        % Second page of figures (frequency domain)
        figure;
        subplot(5,2,1);
        plot(frequencies, abs(MT_fft));
        title('Amplitude spectrum of the recorded audio signal');
        xlabel('Frequency (Hz)');
        ylabel('Amplitude');

        subplot(5,2,2);
        plot(frequencies, abs(Modulation1_fft), 'r');
        title('Amplitude spectrum of modulation with carrier fp1');
        xlabel('Frequency (Hz)');
        ylabel('Amplitude');

        subplot(5,2,3);
        plot(frequencies, abs(Modulation2_fft), 'b');
        title('Amplitude spectrum of modulation with carrier fp2');
        xlabel('Frequency (Hz)');
        ylabel('Amplitude');

        subplot(5,2,4);
        plot(frequencies, abs(Demodulation1_fft));
        title('Amplitude spectrum of demodulation with carrier fp1');
        xlabel('Frequency (Hz)');
        ylabel('Amplitude');

        subplot(5,2,5);
        plot(frequencies, abs(Demodulation2_fft));
        title('Amplitude spectrum of demodulation with carrier fp2');
        xlabel('Frequency (Hz)');
        ylabel('Amplitude');

    else
        disp('Please respond with Yes or No.');
    end
end
