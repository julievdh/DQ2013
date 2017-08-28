% Author: Lauro Ojeda, 20014-2015
function [W,A,PERIOD,M] = getdata_dtag3(DIR_NAME, FILE)

PERIOD = 1/200;
% Average mag calibration constants!
Pcal = [2771.60000000000 -115;];

Mcalx = [748.854	-256.492];
Mcaly = [767.011	-258.131];
Mcalz = [760.754	-254.550];

Acalx = [4.86000000000000 -3.45540000000000];
Acaly = [4.78980000000000 -3.26640000000000];
Acalz = [4.95020000000000 -2.69840000000000];

A2calx = [4.96940000000000 -2.40050000000000];
A2caly = [4.89930000000000 -2.47810000000000];
A2calz = [5.06810000000000 -2.52840000000000];

Wcalx = [32 -12.1500000000000];
Wcaly = [31 -8.29000000000000];
Wcalz = [27 -13.9300000000000];

% This rotation has not been verifyed and may be incorrect. Tha Accelerometer seems to be off-axis
ROTA1 = [1  0  0;
			  0  1  0;
				0  0  -1];

ROTA2 = [1  0  0;
			  0 -1  0;
				0  0 -1];

ROTW = [1  0 0;
			  0 -1 0;
				0  0 1];

X = d3readswv(DIR_NAME, FILE);

% Parse data
Mraw = [];
Mraw(:,1) = X.x{1};
Mraw(:,2) = X.x{2};
Mraw(:,3) = X.x{3};

Araw = [];
Araw(:,1) = X.x{7};
Araw(:,2) = X.x{8};
Araw(:,3) = X.x{9};

Praw = [];
Praw(:,1) = X.x{10};

A2raw = [];
A2raw(:,1) = X.x{20};
A2raw(:,2) = X.x{21};
A2raw(:,3) = X.x{22};

Wraw = [];
Wraw(:,1) = X.x{23};
Wraw(:,2) = X.x{24};
Wraw(:,3) = X.x{25};

% Apply scale factors

M(:,1) = polyval(Mcalx,Mraw(:,1));
M(:,2) = polyval(Mcaly,Mraw(:,2));
M(:,3) = polyval(Mcalz,Mraw(:,3));

A(:,1) = polyval(Acalx,Araw(:,1));
A(:,2) = polyval(Acaly,Araw(:,2));
A(:,3) = polyval(Acalz,Araw(:,3));

A2(:,1) = polyval(A2calx,A2raw(:,1));
A2(:,2) = polyval(A2caly,A2raw(:,2));
A2(:,3) = polyval(A2calz,A2raw(:,3));

W(:,1) = polyval(Wcalx,Wraw(:,1));
W(:,2) = polyval(Wcaly,Wraw(:,2));
W(:,3) = polyval(Wcalz,Wraw(:,3));

P = polyval(Pcal,Praw);
P = -1*(P+13);

% Convert to aeronautics reference axis convention
W = W * PERIOD * ROTW;
A = A2 * ROTA2;

% Modify scale factors using rate-table calibrated data
RATE_SCALE_FACTOR_CORRECTION = [0.781084, 0.862463, 0.954276];
W(:, 1) = W(:, 1) * RATE_SCALE_FACTOR_CORRECTION(1); 
W(:, 2) = W(:, 2) * RATE_SCALE_FACTOR_CORRECTION(2); 
W(:, 3) = W(:, 3) * RATE_SCALE_FACTOR_CORRECTION(3); 
