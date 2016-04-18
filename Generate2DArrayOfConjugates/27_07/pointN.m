function point=pointN(R,N)
%R=50;N=6;
b=1;
while b==1
    if N==6
        point=point6(R,6);
        b=0;
    elseif N==18
        point=point18(R,18);
        b=0;
    elseif N==38
        point=point38(R,38);
        b=0;
    elseif N==66
        point=point66(R,66);
        b=0;
    elseif N==102
        point=point102(R,102);
        b=0;
    else
        %'Wrong N';
        b=0;
    end
end

dlmwrite('tmp/point.txt',point);
point=load('tmp/point.txt');
end

function point=point6(R,N)

point=zeros(N,3);

%replace
point(1,:)=[0,0,R];


theta=0;phi=pi/2;
for i=2:5
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end

point(6,:)=[0,0,-R];

end

function point=point18(R,N)


point=zeros(N,3);

%replace
point(1,:)=[0,0,R];


theta=0;phi=pi/4;
for i=2:5
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end

theta=0;phi=2*pi/4;
for i=6:13
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/8;
end

theta=0;phi=3*pi/4;
for i=14:17
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end

point(18,:)=[0,0,-R];

end

function point=point38(R,N)

point=zeros(N,3);

%replace
point(1,:)=[0,0,R];


theta=0;phi=pi/6;
for i=2:5
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end

theta=0;phi=2*pi/6;
for i=6:13
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/8;
end

theta=0;phi=3*pi/6;
for i=14:25
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/12;
end


theta=0;phi=4*pi/6;
for i=26:33
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/8;
end

theta=0;phi=5*pi/6;
for i=34:38
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end

point(38,:)=[0,0,-R];

end

function point=point66(R,N)

point=zeros(N,3);

%replace
point(1,:)=[0,0,R];


theta=0;phi=pi/8;
for i=2:5
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end

theta=0;phi=2*pi/8;
for i=6:13
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/8;
end

theta=0;phi=3*pi/8;
for i=14:25
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/12;
end


theta=0;phi=4*pi/8;
for i=26:41
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/16;
end

theta=0;phi=5*pi/8;
for i=42:53
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/12;
end

theta=0;phi=6*pi/8;
for i=54:61
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/8;
end

theta=0;phi=7*pi/8;
for i=62:65
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end


point(66,:)=[0,0,-R];

end

function point=point102(R,N)

point=zeros(N,3);

%replace
point(1,:)=[0,0,R];


theta=0;phi=pi/10;
for i=2:2+4-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end

theta=0;phi=2*pi/10;
for i=2+4:2+4+8-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/8;
end

theta=0;phi=3*pi/10;
for i=2+4+8:2+4+8+12-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/12;
end


theta=0;phi=4*pi/10;
for i=2+4+8+12:2+4+8+12+16-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/16;
end

theta=0;phi=5*pi/10;
for i=2+4+8+12+16:2+4+8+12+16+20-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/20;
end

theta=0;phi=6*pi/10;
for i=2+4+8+12+16+20:2+4+8+12+16+20+16-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/16;
end

theta=0;phi=7*pi/10;
for i=2+4+8+12+16+20+16:2+4+8+12+16+20+16+12-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/12;
end

theta=0;phi=8*pi/10;
for i=2+4+8+12+16+20+16+12:2+4+8+12+16+20+16+12+8-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/8;
end

theta=0;phi=9*pi/10;
for i=2+4+8+12+16+20+16+12+8:2+4+8+12+16+20+16+12+8+4-1
    point(i,1)=R*sin(phi).*cos(theta);
    point(i,2)=R*sin(phi).*sin(theta);
    point(i,3)=R*cos(phi);
    theta=theta+2*pi/4;
end


point(102,:)=[0,0,-R];

end