function [Atoms]=readDNA(L)

if L==20
    num_Atoms=118;
    num_Bonds=116;
    num_Angles=186;
    num_Dihedrals=72;
end

fidtmp_Atoms=fopen('tmp/tmp_Atoms.txt','w');
fidtmp_Bonds=fopen('tmp/tmp_Bonds.txt','w');
fidtmp_Angles=fopen('tmp/tmp_Angles.txt','w');
fidtmp_Dihedrals=fopen('tmp/tmp_Dihedrals.txt','w');

getParagraph('Atoms','data.DNA',fidtmp_Atoms,num_Atoms);
getParagraph('Bonds','data.DNA',fidtmp_Bonds,num_Bonds);
getParagraph('Angles','data.DNA',fidtmp_Angles,num_Angles);
getParagraph('Dihedrals','data.DNA',fidtmp_Dihedrals,num_Dihedrals);

fclose(fidtmp_Atoms);
fclose(fidtmp_Bonds);
fclose(fidtmp_Angles);
fclose(fidtmp_Dihedrals);

Atoms=load('tmp/tmp_Atoms.txt');
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

