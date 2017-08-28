% Kolohe A2 Drag Loading
path(path, './mark_algorithms/d3matlab')
path(path, './mark_algorithms/XML4MATv2')

FILTER = 1;
FILENAME = 'tt13_287e01';
DIR_NAME = 'data/WHOIS_tag/raw_data/tt13_287e01';
BOAT_FILE = 'Kolohe_A2';
% BOAT_FILE  = sprintf('%s/%s_boat.mat', DIR_NAME, FILENAME);
% SECTION  = round([165624, 176930]*0.0050); % Just the tag (A)
SECTION  = round([189966, 199960]*0.0050); % Just the tag (A2)
% SECTION  = round([233229, 247542]*0.0050); % Just the tag (A3)
% SECTION  = round([291443, 306859]*0.0050); % Just the tag (A4)
% GPS_SHIFT = 13;

[W, A, PERIOD] = getdata_dtag3(DIR_NAME, FILENAME);
[W, A] = getdata(W, A, PERIOD, SECTION);
% Compute attitude angles
inertial_results = compute_att(W, A, PERIOD, 1);
% Detect fluking cycle
inertial_results = detect_fluking_sections(inertial_results);
% Integrate boat information
create_gps_tt13_287e01_A2
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
[net_thrust, net_drag] = plt_work_details(strokes, power, PERIOD);

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
title('Lono A2')

figure
plot(stroke_period,stroke_amp,'.')
xlabel('Stroke Period (s)')
ylabel('Stroke AMplitude (deg)')
axis([0 1 0 12])


% Fit Data
pFit = 1
speed = linspace(1,7,100)';


P_Thrust = polyfit(Vfave',net_thrust,pFit);
P_Drag = polyfit(Vfave',net_drag,pFit);

ThrustFit = POLYVAL(P_Thrust,speed);
DragFit = POLYVAL(P_Drag,speed);

figure
subplot(311)
plot(inertial_results.Am_kf)
xlabel('Samples')
ylabel('Fluking Angle (Deg)')
title('Lono A2')
% axis([50800 123585 -15 20])

subplot(312)
plot(inertial_results.Vm_kf)
xlabel('Samples')
ylabel('Velocity (m/s)')
% axis([50800 123585 0 6])

subplot(313)

plot(Vfave,net_thrust,'.b')
hold on
plot(speed,ThrustFit,'k','linewidth',3)

plot(Vfave,net_drag,'.r')
plot(speed,DragFit,'k','linewidth',3)


save Kolohe_Loading_A2