function varargout = Main(varargin)
    % NigerianCurrencyRecognition MATLAB code for NigerianCurrencyRecognition.fig
    %      NigerianCurrencyRecognition, by itself, creates a new NigerianCurrencyRecognition or raises the existing
    %      singleton*.
    %
    %      H = NigerianCurrencyRecognition returns the handle to a new NigerianCurrencyRecognition or the handle to
    %      the existing singleton*.
    %
    %      NigerianCurrencyRecognition('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in NigerianCurrencyRecognition.M with the given input arguments.
    %
    %      NigerianCurrencyRecognition('Property','Value',...) creates a new NigerianCurrencyRecognition or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before NigerianCurrencyRecognition_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to NigerianCurrencyRecognition_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".

    % Edit the above text to modify the response to help NigerianCurrencyRecognition

    % Last Modified by GUIDE v2.5 09-Apr-2024 09:58:40

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @NigerianCurrencyRecognition_OpeningFcn, ...
                       'gui_OutputFcn',  @NigerianCurrencyRecognition_OutputFcn, ...
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


    % --- Executes just before NigerianCurrencyRecognition is made visible.
    function NigerianCurrencyRecognition_OpeningFcn(hObject, eventdata, handles, varargin)
        % This function has no output args, see OutputFcn.
        % hObject    handle to figure
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        % varargin   command line arguments to NigerianCurrencyRecognition (see VARARGIN)

        % Choose default command line output for NigerianCurrencyRecognition
        handles.output = hObject;

        % Update handles structure
        guidata(hObject, handles);

        % UIWAIT makes NigerianCurrencyRecognition wait for user response (see UIRESUME)
        % uiwait(handles.figure1);
        

    % --- Outputs from this function are returned to the command line.
    function varargout = NigerianCurrencyRecognition_OutputFcn(hObject, eventdata, handles) 
        % varargout  cell array for returning output args (see VARARGOUT);
        % hObject    handle to figure
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)

        % Get default command line output from handles structure
        varargout{1} = handles.output;


    % --- Executes on button press in selectImageButton.
    function selectImageButton_Callback(hObject, eventdata, handles)
        % hObject    handle to selectImageButton (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)

        [imname,impath] = uigetfile({'*.jpg;*.png'}, 'Select an image file');
        if imname ~= 0
            img = imread(fullfile(impath, imname));
            % Display the selected image
            axes(handles.originalImageAxes);
            imshow(img);
            
            % Perform currency recognition
            recognizedCurrency = recognizeCurrency(img);
            if ~isempty(recognizedCurrency)
                % Display recognized currency
                set(handles.recognizedCurrencyText, 'String', recognizedCurrency);
            else
                % If currency recognition fails
                set(handles.recognizedCurrencyText, 'String', 'Recognition failed');
            end
        end


    % --- Executes during object creation, after setting all properties.
    function recognizedCurrencyText_CreateFcn(hObject, eventdata, handles)
        % hObject    handle to recognizedCurrencyText (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    empty - handles not created until after all CreateFcns called

        % Hint: edit controls usually have a white background on Windows.
        %       See ISPC and COMPUTER.
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end

    % Function to recognize Nigerian currency
    function currency = recognizeCurrency(img)
        % Convert image to grayscale
        grayImg = rgb2gray(img);
        
        % Perform currency recognition logic here
        % For demonstration, let's assume simple thresholding based on average intensity
        
        % Calculate average intensity of the grayscale image
        avgIntensity = mean(grayImg(:));
        
        % Threshold values for different Nigerian currency denominations
        threshold200 = 100;
        threshold500 = 120;
        threshold1000 = 150;
        
        % Compare average intensity with threshold values
        if avgIntensity < threshold200
            currency = 'N200';
        elseif avgIntensity < threshold500
            currency = 'N500';
        elseif avgIntensity < threshold1000
            currency = 'N1000';
        else
            % If none of the thresholds are met, return empty for unrecognized
            currency = '';
        end
    

%This code sets up a GUI with a button for selecting an image file (`selectImageButton`). When the user selects an image file, it loads the image, displays it on an axes object (`originalImageAxes`), and then calls a function `recognizeCurrency` to perform currency recognition logic. In the `recognizeCurrency` function, a simple intensity-based thresholding approach is used to determine the denomination of the Nigerian currency based on the average intensity of the grayscale image. Depending on the intensity level, it classifies the currency as N200, N500, or N1000.
