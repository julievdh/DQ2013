% Correct coordinates for No Boat swimming tracks from video

close all; 

% load data
% e.g., Kolohe
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/NoBoatVideo
load('KoloheNoBoatVid')

% A.d271 is base file to which all are corrected to

% correct all Kolohe files
[Kolohe.A4.d288,Kolohe.A.d271] = aligntrainers(Kolohe.A4.d288,Kolohe.A.d271);
[Kolohe.A4.d272,Kolohe.A.d271] = aligntrainers(Kolohe.A4.d272,Kolohe.A.d271);
[Kolohe.A.d276,Kolohe.A.d271] = aligntrainers(Kolohe.A.d276,Kolohe.A.d271);
[Kolohe.A.d282,Kolohe.A.d271] = aligntrainers(Kolohe.A.d282,Kolohe.A.d271);
[Kolohe.C.d278,Kolohe.A.d271] = aligntrainers(Kolohe.C.d278,Kolohe.A.d271);
[Kolohe.C.d269,Kolohe.A.d271] = aligntrainers(Kolohe.C.d269,Kolohe.A.d271);

% save Kolohe structure
keep Kolohe; save('KoloheNoBoatVid')

%% Now with Lono
load('LonoNoBoatVid')

% correct all Lono files
[Lono.A.d269,Kolohe.A.d271] = aligntrainers(Lono.A.d269,Kolohe.A.d271);
[Lono.A.d278,Kolohe.A.d271] = aligntrainers(Lono.A.d278,Kolohe.A.d271);
[Lono.A.d283,Kolohe.A.d271] = aligntrainers(Lono.A.d283,Kolohe.A.d271);
[Lono.A4.d273,Kolohe.A.d271] = aligntrainers(Lono.A4.d273,Kolohe.A.d271);
[Lono.A4.d276,Kolohe.A.d271] = aligntrainers(Lono.A4.d276,Kolohe.A.d271);
[Lono.A4.d281,Kolohe.A.d271] = aligntrainers(Lono.A4.d281,Kolohe.A.d271);
[Lono.C.d275,Kolohe.A.d271] = aligntrainers(Lono.C.d275,Kolohe.A.d271);
[Lono.C.d280,Kolohe.A.d271] = aligntrainers(Lono.C.d280,Kolohe.A.d271);

% save Lono structure
save('LonoNoBoatVid','Lono')

%% Now with Liko
load('LikoNoBoatVid')

% correct all Liko files
[Liko.A.d279,Kolohe.A.d271] = aligntrainers(Liko.A.d279,Kolohe.A.d271);
[Liko.C.d273,Kolohe.A.d271] = aligntrainers(Liko.C.d273,Kolohe.A.d271);

% save Liko structure
save('LikoNoBoatVid','Liko')

%% Now with Nainoa
load('NainoaNoBoatVid')

% correct all Nainoa files
[Nainoa.A.d273,Kolohe.A.d271] = aligntrainers(Nainoa.A.d273,Kolohe.A.d271);
[Nainoa.C.d276,Kolohe.A.d271] = aligntrainers(Nainoa.C.d276,Kolohe.A.d271);

% save Liko structure
save('NainoaNoBoatVid','Nainoa')
