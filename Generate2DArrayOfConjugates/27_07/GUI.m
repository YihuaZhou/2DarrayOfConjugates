function varargout = GUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function GUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

handles.R=50;
handles.N=6;
handles.L=20;
handles.T=110;
handles.Dis=0;

guidata(hObject, handles);

function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function N_popu_Callback(hObject, eventdata, handles)
val=get(hObject,'Value');
switch val
    case 1
        handles.N=6;
    case 2
        handles.N=18;
    case 3
        handles.N=38;
    case 4
        handles.N=66;
    case 5
        handles.N=102;
end
pointN(handles.R,handles.N);
guidata(hObject,handles);

function N_popu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function R_popu_Callback(hObject, eventdata, handles)
val=get(hObject,'Value');
switch val
    case 1
        handles.R=50;
    case 2
        handles.R=100;     
    case 3
        handles.R=500;
    case 4
        handles.R=1000;
    case 5
        handles.R=5000;
end
guidata(hObject,handles);

function R_popu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function L_popu_Callback(hObject, eventdata, handles)
val=get(hObject,'Value');
switch val
    case 1
        handles.L=20;       
    case 2
        handles.L=40;     
    case 3
        handles.L=60;
    case 4
        handles.L=80;
    case 5
        handles.L=100;
end
guidata(hObject,handles);

function L_popu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function T_popu_Callback(hObject, eventdata, handles)
val=get(hObject,'Value');
switch val
    case 1
        handles.T=110;
    case 2
        handles.T=210;
    case 3
        handles.T=220;
    case 4
        handles.T=222;
end
guidata(hObject,handles);

function T_popu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Generate_Data_Callback(hObject, eventdata, handles)
set(handles.Processing,'string','Processing...');
set(handles.Generate_Data,'enable','off');
set(handles.Display_Data,'enable','off');
pause(1);
handles.Dis=unitStructure(handles.R,handles.N,handles.L,handles.T);
set(handles.Generate_Data,'enable','on');
set(handles.Display_Data,'enable','on');
set(handles.Processing,'string','Done');
guidata(hObject,handles);

function Display_Data_Callback(hObject, eventdata, handles)
set(handles.Processing,'string','Processing...');
set(handles.Generate_Data,'enable','off');
set(handles.Display_Data,'enable','off');
cla(handles.figure,'reset');
pause(1);
displayUSData();
set(handles.Dis_text,'string',handles.Dis);
delete('tmp/*');
set(handles.Generate_Data,'enable','on');
set(handles.Display_Data,'enable','on');
set(handles.Processing,'string','Done');
guidata(hObject,handles);

function Clear_Callback(hObject, eventdata, handles)
set(handles.Processing,'string','Processing...');
cla(handles.figure,'reset');
delete('tmp/*');
set(handles.Generate_Data,'enable','on');
set(handles.Display_Data,'enable','on');
set(handles.Processing,'string','Ready');
