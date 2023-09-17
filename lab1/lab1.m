
y = load("f5.txt")

T = 5
d_t = 0.01
t = 0:d_t:T
N = length(y)

figure
plot(t, y), grid

fourier = zeros(1, N); 
for k = 1:N 
    for m = 1:N
        fourier(k) = fourier(k) + 1/N*y(m)*exp(1)^(-1i*2*pi*k*m/N);
    end
end 

d_f = 1/T
n = length(t)
plot(abs(fourier)), grid

f = 0:d_f:round(n/2) * d_f;
figure
plot(f,abs(fourier(1:round(n/2)+1)))

fourier = abs(fourier);
cnt = 0;
ext = zeros(2, 1);
for j = 3:round(N/2) - 1
    if (fourier(j) > fourier(j-1) && fourier(j) > fourier(j+1) && abs(fourier(j) - fourier(j-1)) > 1)
        cnt += 1;
        ext(cnt) = j*d_f;
    end
end

sin_f = sin(2*pi*ext(1)*t);
A = [sum(t.^6), sum(t.^5), sum(t.^4), sum(sin_f.*t.^3), sum(t.^3);
     sum(t.^5), sum(t.^4), sum(t.^3), sum(sin_f.*t.^2), sum(t.^2);
     sum(t.^4), sum(t.^3), sum(t.^2), sum(sin_f.*t),    sum(t);
     sum(sin_f.*t.^3), sum(sin_f.*t.^2), sum(sin_f.*t), sum(sin_f.*sin_f) sum(N*sin_f);
     sum(t.^3), sum(t.^2), sum(t), sum(N*sin_f),  N];

c = [sum(y.*t.^3), sum(y.*t.^2), sum(y.*t), sum(y.*sin_f), sum(y)];

a = A\c'

plot approximating function
approx_func = a(1).*t.^3 + a(2).*t.^2 + a(3).*t + a(4).*sin_f + a(5);
plot(t, approx_func), grid
figure

error_value = sum((approx_func - y).^2)

error_value = sum((aprox_f-y).^2)
