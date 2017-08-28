% Author: Lauro Ojeda, 2014-2015
path(path, './mark_algorithms/d3matlab')
path(path, './mark_algorithms/XML4MATv2')

FILTER = 1;
sample_file = {'tt13_287c01'};

DIR = 'data/WHOIS_tag/raw_data/';
DIR_NAME = sprintf('%s%s', DIR, sample_file{1});
BOAT_FILE  = sprintf('%s/%s_boat.mat', DIR_NAME, sample_file{1});
SECTION  = [600, 1400];
GPS_SHIFT = 195.5;

[W, A, PERIOD] = getdata_dtag3(DIR_NAME, sample_file{1});
[W, A] = getdata(W, A, PERIOD, SECTION);
% Compute attitude angles
inertial_results = compute_att(W, A, PERIOD, 1);
% Detect fluking cycle
inertial_results = detect_fluking_sections(inertial_results);
% Integrate boat information
inertial_results = integrate_boat_info_frwd(inertial_results, PERIOD, BOAT_FILE, GPS_SHIFT);

%% Filter the acceleration data
A_kf = inertial_results.A_kf;

R = 10;
% A_kf = [];
A_kf_dec = [];
A_kf_filt = []


A_kf_dec(:,1) = decimate(A_kf(:,1),R);
A_kf_filt(:,1) = interp(A_kf_dec(:,1),R);

A_kf_dec(:,2) = decimate(A_kf(:,2),R);
A_kf_filt(:,2) = interp(A_kf_dec(:,2),R);

figure
plot(A_kf(75860:80000,1),'k')
hold on
plot(A_kf_filt(75860:80000,1),'r')


inertial_results.A_kf = A_kf_filt;

%% Segment strokes
strokes = stroke_segmentation(inertial_results, PERIOD, FILTER);
%Stroke Period, Frequency, and amplitude
stroke_period = strokes.samples * PERIOD;
stroke_freq = 1./stroke_period;
pitch = (strokes.fluking_angle_norm * 180 / pi);

% Plot results
plt_pitch(strokes);
DIRECTION = 'FRWD';
plt_acc(strokes, DIRECTION);
plt_vel(strokes, DIRECTION);
DIRECTION = 'LTRL';
plt_acc(strokes, DIRECTION);
plt_vel(strokes, DIRECTION);

plt_gps(inertial_results, PERIOD, GPS_SHIFT);
power = plt_power_details(strokes);
[net_trust, net_drag] = plt_work_details(strokes, power, PERIOD);

N = length(inertial_results.An);
Speed = inertial_results.Vm_kf;
time = (1:N)*PERIOD;
Distance = trapz(time,Speed)

Speed_mean = mean(Speed(39332:101064))
Speed_SD = std(Speed(39332:101064))

save NainoaA4_SpeedandDist Speed time Speed_mean Speed_SD Distance 

%% Plot data
Vfave = (mean(strokes.V_frwd));
stroke_amp = max(pitch);

% Plot Gait stuff
figure
plot(Vfave,stroke_freq,'.')
axis([0 6 0 3])
xlabel('Velocity (m/s)')
ylabel('Stroke Freq (Hz)')
title('Nainoa A2')

figure
plot(Vfave,stroke_period,'.')
axis([0 6 0 1])
xlabel('Velocity (m/s)')
ylabel('Stroke Period (s)')
title('Nainoa A2')

figure
plot(Vfave,stroke_amp,'.')
axis([0 6 0 12])
xlabel('Velocity (m/s)')
ylabel('Stroke Amplitude (deg)')
title('Nainoa A2')

figure
plot(stroke_period,stroke_amp,'.')
xlabel('Stroke Period (s)')
ylabel('Stroke AMplitude (deg)')
axis([0 1 0 12])
% Fit Data
speed = linspace(1.5,5,100)';

p1T = 37.26;
p2T =  -17.5;

p1D = -42.25;
p2D =  8.976;

ThrustFit = p1T.*speed+p2T;
DragFit = p1D.*speed+p2D;

figure
subplot(311)
plot(inertial_results.Am_kf)
xlabel('Samples')
ylabel('Fluking Angle (Deg)')
title('Nainoa A2')
axis([30000 110000 -15 20])

subplot(312)
plot(inertial_results.Vm_kf)
xlabel('Samples')
ylabel('Velocity (m/s)')
axis([30000 110000 0 6])

subplot(313)

plot(Vfave,net_trust,'.b')
hold on
plot(speed,ThrustFit,'k','linewidth',3)

plot(Vfave,net_drag,'.r')
plot(speed,DragFit,'k','linewidth',3)



save Nainoa_A4
