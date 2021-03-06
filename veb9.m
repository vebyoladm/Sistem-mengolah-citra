function varargout = veb9(varargin)
% VEB9 MATLAB code for veb9.fig
%      VEB9, by itself, creates a new VEB9 or raises the existing
%      singleton*.
%
%      H = VEB9 returns the handle to a new VEB9 or the handle to
%      the existing singleton*.
%
%      VEB9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VEB9.M with the given input arguments.
%
%      VEB9('Property','Value',...) creates a new VEB9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before veb9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to veb9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help veb9

% Last Modified by GUIDE v2.5 19-Apr-2021 20:58:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @veb9_OpeningFcn, ...
                   'gui_OutputFcn',  @veb9_OutputFcn, ...
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


% --- Executes just before veb9 is made visible.
function veb9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to veb9 (see VARARGIN)

% Choose default command line output for veb9
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes veb9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = veb9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global I
open=guidata(gcbo);
[namafile,direktori]=uigetfile({'*.jpg;*.bmp;*.tif'}, 'OpenImage');
I=imread(namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));colormap('gray');
set(open.axes1,'Userdata',I)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global J
open=guidata(gcbo);
[namafile,direktori]=uigetfile({'*.jpg;*.bmp;*.tif'}, 'OpenImage');
J=imread(namafile);
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(J));colormap('gray');
set(open.axes2,'Userdata',J)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global I
global J
open=guidata(gcbo);

[r1,c1] = size(I);
[r2,c2] = size(J);
if (r1 == r2) && (c1 == c2)
    for x = 1 : r1
        for y = 1 : c1
            C(x,y) = I(x,y) + J(x,y);
        end
    end
end

set(open.figure1,'currentaxes',open.axes3);
set(imagesc(C));colormap('gray');
set(open.axes3,'userdata',C);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global I
global J
open=guidata(gcbo);
I = rgb2ind(I,2);
J = rgb2ind(J,2);

[r1, c1] = size(I);
[r2, c2] = size(J);

if (r1 == r2) && (c1 == c2)
    for x = 1 : r1
        for y = 1 : c1
            D(x,y) = and(I(x,y),J(x,y));
    end
    end
end
set(open.figure1,'currentaxes',open.axes4);
set(imagesc(D));colormap('gray');
set(open.axes4,'userdata',D);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
