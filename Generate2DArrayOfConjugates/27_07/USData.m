function USData(N,R,L,type)

if L==20
    num_Atoms=118;
    num_Bonds=116;
    num_Angles=186;
    num_Dihedrals=72;
else
end

if type==110
    num_units=1;
elseif type==210
    num_units=2;
elseif type==220
    num_units=4;
elseif type==222
    num_units=8;
else
end

num_Atoms_total=num_Atoms*N*num_units;
num_Bonds_total=num_Bonds*N*num_units;
num_Angles_total=num_Angles*N*num_units;
num_Dihedrals_total=num_Dihedrals*N*num_units;

fidin=fopen('USData.txt','w');

fprintf(fidin,'%s%d%s%d%s%d%s%d\n','Unit structure for type ',type,': N=',N,' R=',R,' L=',L);
fprintf(fidin,'\n');

fprintf(fidin,'    %d %s\n',num_Atoms_total,'atoms');
fprintf(fidin,'    %d %s\n',num_Bonds_total,'bonds');
fprintf(fidin,'    %d %s\n',num_Angles_total,'angles');
fprintf(fidin,'    %d %s\n',num_Dihedrals_total,'Dihedrals');
fprintf(fidin,'\n');

if L==20
    fprintf(fidin,'    %s\n','17 atom types');
    fprintf(fidin,'    %s\n','6 bond types');
    fprintf(fidin,'    %s\n','26 angle types');
    fprintf(fidin,'    %s\n','2 Dihedral types');
    fprintf(fidin,'\n');
    
    fprintf(fidin,'    %s\n','-466.440000 1399.320000 xlo xhi');
    fprintf(fidin,'    %s\n','-466.440000 466.440000 ylo yhi');
    fprintf(fidin,'    %s\n','-466.440000 466.440000 ylo yhi');
    
    fprintf(fidin,'\n%s\n\n','Masses');
    getParagraph('Masses','data.DNA',fidin,17);
    fprintf(fidin,'\n%s\n\n','Bond Coeffs');
    getParagraph('Bond Coeffs','data.DNA',fidin,6);
    fprintf(fidin,'\n%s\n\n','Angle Coeffs');
    getParagraph('Angle Coeffs','data.DNA',fidin,26);
    fprintf(fidin,'\n%s\n\n','Dihedral Coeffs');
    getParagraph('Dihedral Coeffs','data.DNA',fidin,2);
else
end


fidin=fopen('USData.txt','a');
fprintf(fidin,'\n%s\n\n','Atoms');
fclose(fidin);
AtomsO=load('tmp/getAtoms.txt'); 
dlmwrite('USData.txt',AtomsO,'delimiter','\t','-append');

fidin=fopen('USData.txt','a');
fprintf(fidin,'\n%s\n\n','Bonds');
fclose(fidin);
BondsO=load('tmp/getBonds.txt'); 
dlmwrite('USData.txt',BondsO,'delimiter','\t','-append');

fidin=fopen('USData.txt','a');
fprintf(fidin,'\n%s\n\n','Angles');
fclose(fidin);
AnglesO=load('tmp/getAngles.txt'); 
dlmwrite('USData.txt',AnglesO,'delimiter','\t','-append');

fidin=fopen('USData.txt','a');
fprintf(fidin,'\n%s\n\n','Dihedrals');
fclose(fidin);
DihedralsO=load('tmp/getDihedrals.txt'); 
dlmwrite('USData.txt',DihedralsO,'delimiter','\t','-append');

end

function getParagraph(str,fidoutStr,fidin,num_line)

%fprintf(fidin,'%s\n\n',str);

fidout=fopen(fidoutStr,'r');

while ~feof(fidout)
    tline=fgetl(fidout);strtrim(tline);
    if strcmp(tline,str)==1
        n=0;
        while ~feof(fidin)
            tline=fgetl(fidout);strtrim(tline);
            if ~isempty(tline)
                fprintf(fidin,'%s\n',tline);
                n=n+1;
                if n==num_line
                    break;
                end;
            end
        end
        break;
    end
end

fclose(fidout);

%fprintf(fidin,'\n');
end

