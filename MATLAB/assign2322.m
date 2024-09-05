v = [4;2];

v = v./(norm(v))

Rot1 = [cos(pi/3),-sin(pi/3);sin(pi/3),cos(pi/3)];

Allvctrs = [v];
Newtempvctr = v;

for i=1:5
    Newtempvctr = Rot1*Newtempvctr;
    Allvctrs = [Allvctrs, Newtempvctr];

end

figure;

for i=1:6
    xaxis = [0,Allvctrs(1,i)];
    yaxis = [0,Allvctrs(2,i)];
    plot(xaxis,yaxis);
    hold on
end

Reflalongx = [1,0;0,-1];
Reflalongy = [-1,0;0,1];

Allvctrs2 = Reflalongx*Allvctrs;

figure;

for i=1:6
    xaxis = [0,Allvctrs2(1,i)];
    yaxis = [0,Allvctrs2(2,i)];
    plot(xaxis,yaxis);
    hold on
end

Allvctrs3 = Reflalongy*Allvctrs;

figure;

for i=1:6
    xaxis = [0,Allvctrs3(1,i)];
    yaxis = [0,Allvctrs3(2,i)];
    plot(xaxis,yaxis);
    hold on
end

v =[1;1]


T1 = [cos(pi/3),-sin(pi/3);sin(pi/3),cos(pi/3)];
T2 = [cos(pi/2),-sin(pi/2);sin(pi/2),cos(pi/2)];

disp('Part 3a')
version1 = (T1*T2)*v
version2 = (T2*T1)*v

figure;
    xaxis1 = [0,version1(1)];
    yaxis1 = [0, version1(2)];
    xaxis2 = [0,version2(1)];
    yaxis2 = [0, version2(2)];
    t=tiledlayout('flow');
    title(t, '3a');
    nexttile;
    plot(xaxis1,yaxis1);
    title('T1*T2')
    xlim([-2 2])
    ylim([-2 2])
    nexttile;
    plot(xaxis2,yaxis2);
    title('T2*T1')
    xlim([-2 2])
    ylim([-2 2])
    hold on

T1 = [cos(pi/6),-sin(pi/6);sin(pi/6),cos(pi/6)];
T2 = [1,0;0,-1];

disp('Part 3b case1')
version1 = (T1*T2)*v
version2 = (T2*T1)*v

figure;
    xaxis1 = [0,version1(1)];
    yaxis1 = [0, version1(2)];
    xaxis2 = [0,version2(1)];
    yaxis2 = [0, version2(2)];
    t=tiledlayout('flow');
    title(t, '3b(case1)');
    nexttile;
    plot(xaxis1,yaxis1);
    title('T1*T2')
    xlim([-2 2])
    ylim([-2 2])
    nexttile;
    plot(xaxis2,yaxis2);
    title('T2*T1')
    xlim([-2 2])
    ylim([-2 2])
    hold on


T1 = [cos(-pi),-sin(-pi);sin(-pi),cos(-pi)];
T2 = [1,0;0,-1];

disp('Part 3b case2')
version1 = (T1*T2)*v
version2 = (T2*T1)*v

figure;
    xaxis1 = [0,version1(1)];
    yaxis1 = [0, version1(2)];
    xaxis2 = [0,version2(1)];
    yaxis2 = [0, version2(2)];
    t=tiledlayout('flow');
    title(t, '3b(case2)');
    nexttile;
    plot(xaxis1,yaxis1);
    title('T1*T2')
    xlim([-2 2])
    ylim([-2 2])
    nexttile;
    plot(xaxis2,yaxis2);
    title('T2*T1')
    xlim([-2 2])
    ylim([-2 2])
    hold on

