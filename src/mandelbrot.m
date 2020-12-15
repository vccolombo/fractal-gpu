function count = mandelbrot(z0, count, N)
    z = z0;
    for n = 0:N
        z = z.*z + z0;
        inside = abs(z) <= 2;
        count = count + inside;
    end
end
