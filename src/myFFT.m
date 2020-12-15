clear;

A1 = rand(5000, 5000);

disp("Sequencial:")
tic;
B1 = fft(A1);
toc
class(B1)

disp ("GPU sem o tempo host->device:")
A2 = gpuArray(A1);
tic;
B2 = fft(A2);
toc
class(B2)

disp ("GPU com o tempo host->device:")
tic;
A2 = gpuArray(A1);
B2 = fft(A2);
toc

disp ("GPU criado direto no device:")
tic;
A3 = rand(size(A1), 'gpuArray');
B3 = fft(A3);
toc;