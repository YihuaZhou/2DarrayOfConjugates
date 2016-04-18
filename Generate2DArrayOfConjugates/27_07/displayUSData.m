function displayUSData()

fid=fopen('USData.txt','r');
fgetl(fid);fgetl(fid);
tline=fgetl(fid);
tline=strtrim(tline);S=regexp(tline,' ','split');num_atoms=str2double(S(1));
tline=fgetl(fid);
tline=strtrim(tline);S=regexp(tline,' ','split');num_bonds=str2double(S(1));
fclose(fid);

fid_USAtoms=fopen('tmp/USAtoms.txt','w');
fid_USBonds=fopen('tmp/USBonds.txt','w');

getParagraph('Atoms','USData.txt',fid_USAtoms,num_atoms);
getParagraph('Bonds','USData.txt',fid_USBonds,num_bonds);

fclose(fid_USAtoms);
fclose(fid_USBonds);

USAtoms=load('tmp/USAtoms.txt');
USBonds=load('tmp/USBonds.txt');

hold on;
xlabel('x');ylabel('y');zlabel('z');axis equal;
view(3);
plot3(USAtoms(:,3),USAtoms(:,4),USAtoms(:,5),'r.');
for j=1:size(USBonds,1)
    line([USAtoms(USBonds(j,3),3),USAtoms(USBonds(j,4),3)],[USAtoms(USBonds(j,3),4),USAtoms(USBonds(j,4),4)],[USAtoms(USBonds(j,3),5),USAtoms(USBonds(j,4),5)]);
end

%%%%%%%%%%%%%
% for i=1:size(USAtoms,1)
%     if mod(i,118)==0
%         pause(0.2);
%     end
%     plot3(USAtoms(i,3),USAtoms(i,4),USAtoms(i,5),'r.');
% %     for j=1:size(USBonds,1)
% %         line([USAtoms(USBonds(j,3),3),USAtoms(USBonds(j,4),3)],[USAtoms(USBonds(j,3),4),USAtoms(USBonds(j,4),4)],[USAtoms(USBonds(j,3),5),USAtoms(USBonds(j,4),5)]);
% %     end 
% end
%%%%%%%%%%%%%%%%%%%

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

