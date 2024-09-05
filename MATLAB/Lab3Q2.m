%Q2
clear all;


BPP_BPG = [0.0969, 0.1360, 0.2235, 0.3031, 0.4052, 0.5331, 0.6847, 0.8666,...
0.9668, 1.0802];
PSNR_BPG = [27.14, 28.15, 29.80, 30.97, 32.23, 33.54, 34.86, 36.22,...
36.89, 37.57];

BPP_VVC = [0.1260, 0.3151, 0.4711, 0.6778, 0.9428, 1.1570];
PSNR_VVC = [28.86, 32.23, 34.07, 35.97, 37.84, 39.10];

BPP_Lee19 = [0.1005, 0.1453, 0.2025, 0.2982, 0.4340, 0.6900, 0.9943, 1.2711];
PSNR_Lee19 = [27.64, 28.80, 29.89, 31.28, 32.85, 35.17, 37.32, 38.94];

BPP_Hu21 = [0.207, 0.308, 0.410, 0.795, 1.059, 1.217];
PSNR_Hu21 = [30.06, 31.61, 32.84, 36.23, 38.03, 38.90];

BPP_GLLMM =[0.0857, 0.1531, 0.2875, 0.4408, 0.6434, 0.7886, 0.9013];
PSNR_GLLMM =[27.86, 29.58, 31.88, 34.07, 36.09, 37.17, 37.95];


figure;

plot(BPP_VVC, PSNR_VVC, 'r--', 'LineWidth', 4, 'Marker', '*', 'DisplayName', 'VVC');
hold on;
plot(BPP_Lee19, PSNR_Lee19, 'b-.', 'LineWidth', 2, 'Marker', '+', 'DisplayName', 'Lee19');
plot(BPP_Hu21, PSNR_Hu21, 'g:', 'LineWidth', 2, 'Marker', 'o', 'DisplayName', 'Hu21');
plot(BPP_GLLMM, PSNR_GLLMM, 'm-', 'LineWidth', 2, 'Marker', 's', 'DisplayName', 'GLLMM');
plot(BPP_BPG, PSNR_BPG, 'c-', 'LineWidth', 2, 'Marker',  cvcv'd', 'DisplayName', 'BPG');


xlabel('Bits/Pixel (BPP)');
ylabel('PSNR (dB)');
grid on;
legend('location', 'Best');