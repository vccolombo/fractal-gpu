clear;

N = 1000; % numero maximo de iteracoes
width = 1000; % largura da imagem resultante
height = 1000; % altura da imagem resultante
xlim = [-2.5, 1.0];
ylim = [-1.25, 1.25];


x = linspace(xlim(1),xlim(2), width);
y = linspace(ylim(1),ylim(2), height);
[xGrid,yGrid] = meshgrid(x,y);
z0 = complex(xGrid,yGrid);
count = zeros(size(z0));

tic;
count = mandelbrot(z0, count, N);
toc;


x = gpuArray.linspace(xlim(1),xlim(2), width);
y = gpuArray.linspace(ylim(1),ylim(2), height);
[xGrid,yGrid] = meshgrid(x,y);
z0 = complex(xGrid,yGrid);
count = zeros(size(z0), 'gpuArray');

tic;
count = mandelbrot(z0, count, N);
toc;

x = gpuArray.linspace(xlim(1),xlim(2), width);
y = gpuArray.linspace(ylim(1),ylim(2), height);
[xGrid,yGrid] = meshgrid(x,y);
z0 = complex(xGrid,yGrid);
count = zeros(size(z0), 'gpuArray');

tic;
count = arrayfun(@mandelbrot, z0, count, N);
toc;


imagesc(x, y, log(count));
colormap([hot(); 0 0 0; 0 0 0]);
axis off;