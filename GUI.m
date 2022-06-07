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
global one_step
one_step = 1;
global gridd;
gridd = 0;
set(handles.line,'Value',1)
set(handles.center,'Enable','off');
set(handles.Input_center_x,'Enable','off');
set(handles.Input_center_y,'Enable','off');
set(handles.radius,'Enable','off');
set(handles.radius_r,'Enable','off');
set(handles.shun_arc,'Enable','off');
set(handles.ni_arc,'Enable','off');
set(handles.minor_arc,'Enable','off');
set(handles.high_arc,'Enable','off');
set(handles.ptp,'Value',1);
set(handles.nothing,'Value',1);
set(handles.nothing,'Enable','off');
set(handles.left_shift,'Enable','off');
set(handles.preset,'Enable','off');
set(handles.something,'Enable','off');
guidata(hObject, handles);

function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)

function Input_x1_Callback(hObject, eventdata, handles)

function Input_x1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Input_y1_Callback(hObject, eventdata, handles)

function Input_y1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Input_x2_Callback(hObject, eventdata, handles)

function Input_x2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Input_y2_Callback(hObject, eventdata, handles)


function Input_y2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Input_step_Callback(hObject, eventdata, handles)

function Input_step_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%直线插补选项的回调函数
function line_Callback(hObject, eventdata, handles) 
set(handles.center,'Enable','off');
set(handles.Input_center_x,'Enable','off');
set(handles.Input_center_y,'Enable','off');
set(handles.radius,'Enable','off');
set(handles.radius_r,'Enable','off');
set(handles.shun_arc,'Enable','off');
set(handles.ni_arc,'Enable','off');
set(handles.minor_arc,'Enable','off');
set(handles.high_arc,'Enable','off');

%圆弧插补选项的回调函数
function circle_Callback(hObject, eventdata, handles)
set(handles.center,'Enable','on');
set(handles.radius,'Enable','on');
set(handles.shun_arc,'Enable','on');
set(handles.ni_arc,'Enable','on');
if get(handles.center,'Value')
    set(handles.Input_center_x,'Enable','on');
    set(handles.Input_center_y,'Enable','on');
else
    set(handles.radius_r,'Enable','on');
    set(handles.minor_arc,'Enable','on');
    set(handles.high_arc,'Enable','on');
end


function left_shift_Callback(hObject, eventdata, handles)
set(handles.something,'Enable','off');


function popupmenu1_Callback(hObject, eventdata, handles)


function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function center_Callback(hObject, eventdata, handles)
set(handles.radius_r,'Enable','off');
set(handles.minor_arc,'Enable','off');
set(handles.high_arc,'Enable','off');
set(handles.Input_center_x,'Enable','on');
set(handles.Input_center_y,'Enable','on');



function Input_center_x_Callback(hObject, eventdata, handles)


function Input_center_x_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function radius_Callback(hObject, eventdata, handles)
set(handles.radius_r,'Enable','on');
set(handles.minor_arc,'Enable','on');
set(handles.high_arc,'Enable','on');
set(handles.Input_center_x,'Enable','off');
set(handles.Input_center_y,'Enable','off');


function radius_r_Callback(hObject, eventdata, handles)


function radius_r_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function shun_arc_Callback(hObject, eventdata, handles)


function ni_arc_Callback(hObject, eventdata, handles)

function minor_arc_Callback(hObject, eventdata, handles)


function high_arc_Callback(hObject, eventdata, handles)


function ptp_Callback(hObject, eventdata, handles)
set(handles.nothing,'Enable','off');
set(handles.left_shift,'Enable','off');
set(handles.preset,'Enable','off');
set(handles.something,'Enable','off');


function dda_Callback(hObject, eventdata, handles)
set(handles.nothing,'Enable','on');
set(handles.left_shift,'Enable','on');
set(handles.preset,'Enable','on');
if get(handles.preset,'Value')
    set(handles.something,'Enable','on');
end


function single_Callback(hObject, eventdata, handles)
sts = handles.sts;
global one_step
one_step = one_step+1;
if one_step > length(sts)
    warndlg('已完成插补！','警告','modal');
    return
end
sing = sts(1:one_step,:);
hold on
plot (sing(:,1),sing(:,2),'b');


function conti_Callback(~, eventdata, handles)
sts = handles.sts;
hold on
%plot (sts(:,1),sts(:,2),'b');
plot (sts(:,1),sts(:,2));


function reset_Callback(hObject, eventdata, handles)
cla
global one_step
one_step = 1;
set(handles.Input_x1,'String','');
set(handles.Input_y1,'String','');
set(handles.Input_x2,'String','');
set(handles.Input_y2,'String','');
set(handles.Input_step,'String','');
set(handles.Input_center_x,'String','');
set(handles.Input_center_y,'String','');
set(handles.radius_r,'String','');
set(handles.line,'Value',1);
set(handles.center,'Value',1);
set(handles.shun_arc,'Value',1);
set(handles.minor_arc,'Value',1);
set(handles.center,'Enable','off');
set(handles.radius,'Enable','off');
set(handles.shun_arc,'Enable','off');
set(handles.ni_arc,'Enable','off');
set(handles.radius_r,'Enable','off');
set(handles.minor_arc,'Enable','off');
set(handles.high_arc,'Enable','off');
set(handles.Input_center_x,'Enable','off');
set(handles.Input_center_y,'Enable','off');
set(handles.nothing,'Value',1);
set(handles.something,'Value',1);
set(handles.ptp,'Value',1);
set(handles.left_shift,'Enable','off');
set(handles.preset,'Enable','off');
set(handles.nothing,'Enable','off');
set(handles.something,'Enable','off');


function preset_Callback(hObject, eventdata, handles)
set(handles.something,'Enable','on');


function something_Callback(hObject, eventdata, handles)


function something_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Input_center_y_Callback(hObject, eventdata, handles)


function Input_center_y_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton6_Callback(hObject, eventdata, handles)


function calculate_Callback(hObject, eventdata, handles)
start_x = str2num(get(handles.Input_x1,'String')); 
start_y = str2num(get(handles.Input_y1,'String'));
end_x = str2num(get(handles.Input_x2,'String'));
end_y = str2num(get(handles.Input_y2,'String'));
step = str2num(get(handles.Input_step,'String'));
if ((start_x-end_x)^2+(start_y-end_y)^2)<step^2
    warndlg('步长过长！','警告','modal');
    return
end

if get(handles.line,'Value')
    plot ([start_x,end_x],[start_y,end_y],'r');
    axis equal
    if get(handles.dda,'Value')
        if get(handles.nothing,'Value')
            left_s = get(handles.left_shift,'Value');
            preset = 1;
        elseif get(handles.left_shift,'Value')
            left_s = get(handles.left_shift,'Value');
            preset = 1;
        elseif get(handles.preset,'Value')
            left_s = 0;
            preset = get(handles.something,'Value');
        end
        sts = DDA_line( start_x,start_y,end_x,end_y,step,preset,left_s );
    else
        sts = PTP_line(start_x,start_y,end_x,end_y,step);
    end
    
    
elseif get(handles.circle,'Value')  %圆弧插补
    
    if get(handles.shun_arc,'Value') %读取顺逆
        sn = 1;
    elseif get(handles.ni_arc,'Value')
        sn = 0;
    end
    
    if get(handles.radius,'Value') %半径条件
        if get(handles.high_arc,'Value')
            procon = 1;
        elseif get(handles.minor_arc,'Value') 
            procon = 0;
        end
        radius = str2num(get(handles.radius_r,'String'));
        fake_r = sqrt((start_x-end_x)^2+(start_y-end_y)^2);
        if (fake_r>2*radius) 
            warndlg('半径参数错误！','警告','modal');
            return;
        end
        cen = CircleCenter( start_x,start_y,end_x,end_y,radius,sn,procon );
        center_x = cen(1);
        center_y = cen(2);
    elseif get(handles.center,'Value')
        center_x = str2num(get(handles.Input_center_x,'String'));
        center_y = str2num(get(handles.Input_center_y,'String'));
    end
    r1 = sqrt( (start_x-center_x)^2+(start_y-center_y)^2 );
    r2 = sqrt( (end_x-center_x)^2+(end_y-center_y)^2 );
    if (r1/r2>1.05||r1/r2<0.95) 
        warndlg('圆心参数错误！','警告','modal');
        return;
    end
    if get(handles.dda,'Value') %数字积分法
        if get(handles.nothing,'Value')
            left_s = get(handles.left_shift,'Value');
            preset = 1;
        elseif get(handles.left_shift,'Value')
            left_s = get(handles.left_shift,'Value');
            preset = 1;
        elseif get(handles.preset,'Value')
            left_s = get(handles.left_shift,'Value');
            preset = get(handles.something,'Value');
        end
        sts = DDA_circle( start_x,start_y,end_x,end_y,center_x,center_y,step,sn,preset,left_s);
    elseif get(handles.ptp,'Value') %逐点比较法
        sts = PTP_circle( start_x,start_y,end_x,end_y,center_x,center_y,step,sn );
    end
    ntn = PTP_circle( start_x,start_y,end_x,end_y,center_x,center_y,0.005,sn );
    plot (ntn(:,1),ntn(:,2),'r')
    hold on
    plot(center_x,center_y,'r*')
    axis equal
end
    handles.sts = sts;
    guidata(hObject, handles);

    
function circle_all_ButtonDownFcn(hObject, eventdata, handles)


function nothing_Callback(hObject, eventdata, handles)
set(handles.something,'Enable','off');

% --------------------------------------------------------------------
function AxesMenu_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function grid_Callback(hObject, eventdata, handles)
global gridd;
gridd = ~gridd;
if gridd
    set(handles.grid,'Checked','On');
    grid on
else
    set(handles.grid,'Checked','Off');
    grid off
end

% --------------------------------------------------------------------
function Clear_Callback(hObject, eventdata, handles)
global one_step
one_step = 1;
cla;

% --------------------------------------------------------------------
function figure1_CreateFcn(hObject, eventdata, handles)
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
ii=imread('backgroud.jpeg');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','on');

% --------------------------------------------------------------------
function lllllll_Callback(hObject, eventdata, handles)
