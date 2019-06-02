function varargout = project_2016544(varargin)
% PROJECT_2016544 MATLAB code for project_2016544.fig
%      PROJECT_2016544, by itself, creates a new PROJECT_2016544 or raises the existing
%      singleton*.
%
%      H = PROJECT_2016544 returns the handle to a new PROJECT_2016544 or the handle to
%      the existing singleton*.
%
%      PROJECT_2016544('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_2016544.M with the given input arguments.
%
%      PROJECT_2016544('Property','Value',...) creates a new PROJECT_2016544 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_2016544_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_2016544_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_2016544

% Last Modified by GUIDE v2.5 03-Dec-2018 15:23:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_2016544_OpeningFcn, ...
                   'gui_OutputFcn',  @project_2016544_OutputFcn, ...
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


% --- Executes just before project_2016544 is made visible.
function project_2016544_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_2016544 (see VARARGIN)

% Choose default command line output for project_2016544
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_2016544 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_2016544_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N;
N = 100;
global n;
n = 0:N - 1;
global Ts;
Ts = 0.01;
global p;
p=heaviside(n*Ts) - heaviside(n*Ts - 20*Ts) + heaviside(n*Ts - 40*Ts)-heaviside(n*Ts - 60*Ts);
axes(handles.axes1);
plot(n,p)
title("Given Signal");
grid on;
legend('P*Ts');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N;
N = 100;
global n;
n = 0:N - 1;
global Ts;
Ts = 0.0001;
global x;
global p;
x = cos(2000*pi*n*Ts);
axes(handles.axes2);
plot(n,x)
grid on;
title("Cosine Function");
legend('Cos(200 * PI*n*Ts)');



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N;
N = 100;
global n;
n = 0:N - 1;
global Ts;

global x;
global y;
global p;
y = p.*x;
axes(handles.axes3);
plot(n,y)
grid on;
title("Product of 1st and 2nd Signal");
legend('P(nTs)*Cos(200 * PI*n*Ts)');



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global N;
N = 100;
global n;
n = 0:N - 1;
global Ts;

global y;
global u;
u = abs(y);

axes(handles.axes4);

plot(n,u);
grid on;
title("Absoulte value of Signal");
legend('Abs');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N;
N = 100;
global n;
n = 0:N - 1;



global u;

axes(handles.axes5);
z = averager(15,u);
plot(n,z);
grid on;
title("Envelope detection and Low Pass Filtering");
legend('LPF');



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r;
r=audiorecorder(22050,16,1);
record(r);



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r;
global b;
stop(r);
b=getaudiodata(r);
audiowrite('wave.wav',b,22050);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r;
global b;
%b=averager(15,b);

[lo up]=envelope(b);
axes(handles.axes6);
plot(b); 
plot(lo); hold on;
plot(up); hold on;
grid on;
title("Envelope detection of Recorded sound");


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs
[x1 fs]=audioread('wave.wav');
 [up o]=envelope(x1);

sound(up,fs);




% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
global fs;
global lo;
global up;
[x fs]=audioread('SpeechDFT-16-8-mono-5secs.wav');
[up lo]=envelope(x);
axes(handles.axes7);
plot(up); hold on;
plot(lo); hold on;
sound(x,fs);
grid on;
title("Envelope detection of Recorded sound");



% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
clear sound;


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lo;
global fs;
sound(lo,fs);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global up;
global fs;
sound(up,fs);
