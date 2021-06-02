function varargout = logikaOR(varargin)
% LOGIKAOR MATLAB code for logikaOR.fig
%      LOGIKAOR, by itself, creates a new LOGIKAOR or raises the existing
%      singleton*.
%
%      H = LOGIKAOR returns the handle to a new LOGIKAOR or the handle to
%      the existing singleton*.
%
%      LOGIKAOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGIKAOR.M with the given input arguments.
%
%      LOGIKAOR('Property','Value',...) creates a new LOGIKAOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before logikaOR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to logikaOR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help logikaOR

% Last Modified by GUIDE v2.5 01-Jun-2021 20:42:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @logikaOR_OpeningFcn, ...
                   'gui_OutputFcn',  @logikaOR_OutputFcn, ...
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


% --- Executes just before logikaOR is made visible.
function logikaOR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to logikaOR (see VARARGIN)

% Choose default command line output for logikaOR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes logikaOR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = logikaOR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function w1_Callback(hObject, eventdata, handles)
% hObject    handle to w1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w1 as text
%        str2double(get(hObject,'String')) returns contents of w1 as a double


% --- Executes during object creation, after setting all properties.
function w1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w2_Callback(hObject, eventdata, handles)
% hObject    handle to w2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w2 as text
%        str2double(get(hObject,'String')) returns contents of w2 as a double


% --- Executes during object creation, after setting all properties.
function w2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bias_Callback(hObject, eventdata, handles)
% hObject    handle to bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bias as text
%        str2double(get(hObject,'String')) returns contents of bias as a double


% --- Executes during object creation, after setting all properties.
function bias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in prosesButton.
function prosesButton_Callback(hObject, eventdata, handles)
% hObject    handle to prosesButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w1 = str2double(get(handles.w1, 'string'));
w2 = str2double(get(handles.w2, 'string'));
bias = str2double(get(handles.bias, 'string'));
net = newp([0 1; 0 1],1);
net.IW{1,1} = [w1, w2];
net.b{1}=[bias];
p = [[1;1] [1;0] [0;1] [0;0]];
t = [1 1 1 0];

net = train(net,p,t);

wOp = net.IW{1,1};
biasOp = net.b{1};

set(handles.wOp, 'String', wOp);
set(handles.biasOp, 'String', biasOp);
