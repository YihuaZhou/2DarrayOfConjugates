function Unit(cx,cy,cz,R,N,L,angleX,angleY,angleZ,Atoms,point,co,con,No_unit)
for i=1:N
    [atomX,atomY,atomZ]=DNA(0,0,0,point,Atoms,i,co,con);
    
    if any(co(1,:)==i)
        %Rotation X
        Rot=[1,0,0;0,cos(angleX),-sin(angleX);0,sin(angleX),cos(angleX)];
        atomXYZ=Rot*[atomX atomY atomZ]';
        atomX=atomXYZ(1,:)';
        atomY=atomXYZ(2,:)';
        atomZ=atomXYZ(3,:)';
    end
    if any(co(2,:)==i)
        %Rotation Y
        Rot=[cos(angleY),0,sin(angleY);0,1,0;-sin(angleY),0,cos(angleY)];
        atomXYZ=Rot*[atomX atomY atomZ]';
        atomX=atomXYZ(1,:)';
        atomY=atomXYZ(2,:)';
        atomZ=atomXYZ(3,:)';
    end
    if any(co(3,:)==i)
        %Rotation Z
        Rot=[cos(angleZ) -sin(angleZ) 0;sin(angleZ) cos(angleZ) 0;0 0 1];
        atomXYZ=Rot*[atomX atomY atomZ]';
        atomX=atomXYZ(1,:)';
        atomY=atomXYZ(2,:)';
        atomZ=atomXYZ(3,:)';
    end
    if co(4,1)==1
        angX=pi;
        Rot=[1,0,0;0,cos(angX),-sin(angX);0,sin(angX),cos(angX)];
        atomXYZ=Rot*[atomX atomY atomZ]';
        atomX=atomXYZ(1,:)';
        atomY=atomXYZ(2,:)';
        atomZ=atomXYZ(3,:)';
    end
    %Transform
    atomX=atomX+cx;
    atomY=atomY+cy;
    atomZ=atomZ+cz;
    
    getUSData(atomX,atomY,atomZ,i,N,No_unit)
end
end

function [atomX,atomY,atomZ]=DNA(cx,cy,cz,point,atom,i,co,con)
centerPoint=[0,0,atom(1,5)];

%Rotation Matrix R
nx=point(i,1)-cx;ny=point(i,2)-cy;nz=point(i,3)-cz;
a=[0;0;1];
if any(co(1,:)==i)
    b=con(1,:)';
elseif any(co(2,:)==i)
    b=con(2,:)';
elseif any(co(3,:)==i)
    b=con(3,:)';
elseif any(co(4,:)==i)
    b=con(4,:)';
else
    b=[nx;ny;nz];
end
cos_theta=(a'*b)/(norm(a)*norm(b));
sin_theta=norm(cross(a,b))/(norm(a)*norm(b));
if sin_theta~=0 
    u=cross(a,b);u=u/norm(u);
    uu=[u(1)*u(1) u(1)*u(2) u(1)*u(3);u(2)*u(1) u(2)*u(2) u(2)*u(3);u(3)*u(1) u(3)*u(2) u(3)*u(3)];
    uuu=[0 -u(3) u(2);u(3) 0 -u(1);-u(2) u(1) 0];
    R=cos_theta*eye(3)+(1-cos_theta)*uu+sin_theta*uuu;                                                          
    R=-R;
else
    if nz<0
        R=eye(3);
    else
        R=-eye(3);
    end
end

%Rotation
atom_new=R*atom(:,3:5)';
atom_new=atom_new';
centerPoint_new=R*centerPoint';
centerPoint_new=centerPoint_new';

atomX=atom_new(:,1)+(point(i,1)-centerPoint_new(1));
atomY=atom_new(:,2)+(point(i,2)-centerPoint_new(2));
atomZ=atom_new(:,3)+(point(i,3)-centerPoint_new(3));
end

function getUSData(atomX,atomY,atomZ,i,N,No_unit)

AtomsO=load('tmp/tmp_Atoms.txt');
m=(i-1)*size(AtomsO,1)+N*(No_unit-1)*size(AtomsO,1);
AtomsO(:,1)=AtomsO(:,1)+m;
AtomsO(:,3)=atomX;
AtomsO(:,4)=atomY;
AtomsO(:,5)=atomZ;
dlmwrite('tmp/getAtoms.txt',AtomsO,'delimiter','\t','-append');

BondsO=load('tmp/tmp_Bonds.txt');
BondsO(:,1)=BondsO(:,1)+(i-1)*size(BondsO,1)+N*(No_unit-1)*size(BondsO,1);
BondsO(:,3)=BondsO(:,3)+m;
BondsO(:,4)=BondsO(:,4)+m;
dlmwrite('tmp/getBonds.txt',BondsO,'delimiter','\t','-append');

AnglesO=load('tmp/tmp_Angles.txt');
AnglesO(:,1)=AnglesO(:,1)+(i-1)*size(AnglesO,1)+N*(No_unit-1)*size(AnglesO,1);
AnglesO(:,3)=AnglesO(:,3)+m;
AnglesO(:,4)=AnglesO(:,4)+m;
AnglesO(:,5)=AnglesO(:,5)+m;
dlmwrite('tmp/getAngles.txt',AnglesO,'delimiter','\t','-append');

DihedralsO=load('tmp/tmp_Dihedrals.txt');
DihedralsO(:,1)=DihedralsO(:,1)+(i-1)*size(DihedralsO,1)+N*(No_unit-1)*size(DihedralsO,1);
DihedralsO(:,3)=DihedralsO(:,3)+m;
DihedralsO(:,4)=DihedralsO(:,4)+m;
DihedralsO(:,5)=DihedralsO(:,5)+m;
DihedralsO(:,6)=DihedralsO(:,6)+m;
dlmwrite('tmp/getDihedrals.txt',DihedralsO,'delimiter','\t','-append');

end