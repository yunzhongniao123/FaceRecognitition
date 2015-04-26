function example(handles)
% load train database
try   
load('prsn.mat','T','TrainDatabasePath');

%load The test image
[InputImage , fileCanceled]= imgetfile;
if fileCanceled 
    disp('No file selected');
else
    
% load the trained database
[m, A, Eigenfaces] = EigenfaceCore(T);

OutputName = Recognition(InputImage, m, A, Eigenfaces);

SelectedImagePath = strcat(TrainDatabasePath,'\Train',OutputName);
SelectedImage = imread(SelectedImagePath);

imshow(InputImage, 'Parent', handles.axes1);
imshow(SelectedImage, 'Parent', handles.axes2);

str = strcat('Matched image is :  ',OutputName);
disp(str)
end
catch ME
    disp(getReport(ME));
end