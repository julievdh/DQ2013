% Author: Lauro Ojeda, 2014-2015
path(path, './mark_algorithms/d3matlab')
path(path, './mark_algorithms/XML4MATv2')
path(path, './mark_algorithms/matlab')


FILTER = 1;
sample_file = {'tt15_065c018'};

DIR = 'data/WHOIS_tag/raw_data/';
DIR_NAME = sprintf('%s%s', DIR, sample_file{1});
BOAT_FILE  = sprintf('%s/%s_boat.mat', DIR_NAME, sample_file{1});
SECTION  = [360-5 370+5];
GPS_SHIFT = 264;

[W, A, PERIOD] = getdata_dtag3(DIR_NAME, sample_file{1});
[W, A] = getdata(W, A, PERIOD, SECTION);
% Compute attitude angles
inertial_results = compute_att(W, A, PERIOD, 1);
% Detect fluking cycle
inertial_results = detect_fluking_sections(inertial_results);
% Integrate boat information
inertial_results = integrate_boat_info_frwd(inertial_results, PERIOD, BOAT_FILE, GPS_SHIFT);
% Segment strokes
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

plt_time(strokes, PERIOD);
plt_freq(strokes, PERIOD);

plt_gps(inertial_results, PERIOD, GPS_SHIFT);
power = plt_power_details(strokes);
[net_trust, net_drag] = plt_work_details(strokes, power, PERIOD);


%% Plot data
Vfave = (mean(strokes.V_frwd));
stroke_amp = max(pitch);

% Plot Gait stuff
figure
plot(Vfave,stroke_freq,'.')
axis([0 6 0 3])
xlabel('Velocity (m/s)')
ylabel('Stroke Freq (Hz)')
title('Lono A')

figure
plot(Vfave,stroke_period,'.')
axis([0 6 0 1])
xlabel('Velocity (m/s)')
ylabel('Stroke Period (s)')
title('Lono A')

figure
plot(Vfave,stroke_amp,'.')
axis([0 6 0 12])
xlabel('Velocity (m/s)')
ylabel('Stroke Amplitude (deg)')
title('Lono A')

figure
plot(stroke_period,stroke_amp,'.')
xlabel('Stroke Period (s)')
ylabel('Stroke AMplitude (deg)')
axis([0 1 0 12])


% Fit Data
speed = linspace(1.5,5,100)';

p1T = 17.63;
p2T =  53.76;

p1D = -33.86;
p2D =  6.645;

ThrustFit = p1T.*speed+p2T;
DragFit = p1D.*speed+p2D;



figure
subplot(311)
plot(inertial_results.Am_kf)
xlabel('Samples')
ylabel('Fluking Angle (Deg)')
title('Lono A')
axis([50800 123585 -15 20])

subplot(312)
plot(inertial_results.Vm_kf)
xlabel('Samples')
ylabel('Velocity (m/s)')
axis([50800 123585 0 6])

subplot(313)

plot(Vfave,net_trust,'.b')
hold on
plot(speed,ThrustFit,'k','linewidth',3)

plot(Vfave,net_drag,'.r')
plot(speed,DragFit,'k','linewidth',3)


save Lono_A
