function varargout =  GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 17-Apr-2016 16:49:17

% Begin initialization code - DO NOT EDIT
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
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function et_ccdSize_Callback(hObject, eventdata, handles)
% hObject    handle to et_ccdSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_ccdSize as text
%        str2double(get(hObject,'String')) returns contents of et_ccdSize as a double


% --- Executes during object creation, after setting all properties.
function et_ccdSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_ccdSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function et_factor_Callback(hObject, eventdata, handles)
% hObject    handle to et_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_factor as text
%        str2double(get(hObject,'String')) returns contents of et_factor as a double


% --- Executes during object creation, after setting all properties.
function et_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function et_mag_Callback(hObject, eventdata, handles)
% hObject    handle to et_mag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_mag as text
%        str2double(get(hObject,'String')) returns contents of et_mag as a double


% --- Executes during object creation, after setting all properties.
function et_mag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_mag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function et_step_Callback(hObject, eventdata, handles)
% hObject    handle to et_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_step as text
%        str2double(get(hObject,'String')) returns contents of et_step as a double


% --- Executes during object creation, after setting all properties.
function et_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_angle_Callback(hObject, eventdata, handles)
% hObject    handle to et_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_angle as text
%        str2double(get(hObject,'String')) returns contents of et_angle as a double


% --- Executes during object creation, after setting all properties.
function et_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in rdbtn_selectBTV.
function rdbtn_selectBTV_Callback(hObject, eventdata, handles)
% hObject    handle to rdbtn_selectBTV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdbtn_selectBTV



function et_NA_Callback(hObject, eventdata, handles)
% hObject    handle to et_NA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_NA as text
%        str2double(get(hObject,'String')) returns contents of et_NA as a double


% --- Executes during object creation, after setting all properties.
function et_NA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_NA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in menu_selectAlgo.
function menu_selectAlgo_Callback(hObject, eventdata, handles)
% hObject    handle to menu_selectAlgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_selectAlgo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_selectAlgo

% --- Executes during object creation, after setting all properties.
function menu_selectAlgo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_selectAlgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function et_extrainfo_Callback(hObject, eventdata, handles)
% hObject    handle to et_extrainfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_extrainfo as text
%        str2double(get(hObject,'String')) returns contents of et_extrainfo as a double

% --- Executes during object creation, after setting all properties.
function et_extrainfo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_extrainfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in btn_selectLr.
function btn_selectLr_Callback(hObject, eventdata, handles)
% hObject    handle to btn_selectLr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lr;
[lr_name  lr_filepath ] = uigetfile(  '*.tif','Select lr images','MultiSelect','on');
lr_name
if isequal(lr_name,0)
    disp('no image selected');
else
    lr_num = size(lr_name,2)
    for i = 1 : lr_num
        str = [lr_filepath ,lr_name{i}]; 
       
        temp = imread(str);
        lr{i} = temp(:,:,1);
        
    end
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
%active button for call super resoluiton function.
consoleInfo = [num2str(lr_num) '  LR images loaded'];
set(handles.tv_console,'String',consoleInfo);
set(handles.btn_run,'Enable','on');


% --- Executes on button press in btn_run.
function btn_run_Callback(hObject, eventdata, handles)
% hObject    handle to btn_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ccdSize = get(handles.et_ccdSize,'String')
magFactor = get(handles.et_mag,'String')

global lr

enhanFactor = get(handles.et_factor,'String')
step = get(handles.et_step,'String')
scan_angle = get(handles.et_angle,'String')
NA = get(handles.et_NA,'String')
algo = get(handles.menu_selectAlgo,'value');
extra_info = get(handles.et_extrainfo,'String');

 if strcmp(extra_info, '') == 0
        extra_info = ['_' extra_info];            
end

ccdSize = str2double(ccdSize);
magFactor = str2double(magFactor);
NA = str2double(NA);
enhanFactor = str2double(enhanFactor);
step = str2double(step);
scan_angle = str2double(scan_angle);

if get(handles.rdbtn_selectBTV,'value')
    disp('btv selected');
end
main(ccdSize,magFactor,NA,step,scan_angle, lr ,enhanFactor,algo,extra_info);
