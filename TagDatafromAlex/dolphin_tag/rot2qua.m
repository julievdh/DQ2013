% Author: Lauro Ojeda, 2003-2015
% Bibliography:
% David Titterton and John Weston, Strapdown Inertial Navigation Technology, 2nd Edition
% pp 45
function [Q]=rot2qua(R)
a = 0.5*(1 + R(1,1) + R(2,2) + R(3,3))^.5;
b = 1/(4*a)*(R(3,2) - R(2,3));
c = 1/(4*a)*(R(1,3) - R(3,1));
d = 1/(4*a)*(R(2,1) - R(1,2));
Q = [a,b,c,d];
