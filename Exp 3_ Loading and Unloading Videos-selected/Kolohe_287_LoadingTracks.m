load 287_Kolohe_Loading

laps = [1 74 137 185 247 303]';  
indx_lap_1 = idx_match_L1(1,1);
    
figure
plot(surf_arr_L1(laps(1,1):laps(2,1),2),surf_arr_L1(laps(1,1):laps(2,1),3),'ok')
hold on
plot(surf_arr_L1(laps(2,1):laps(3,1),2),surf_arr_L1(laps(2,1):laps(3,1),3),'ok')
plot(surf_arr_L1(laps(3,1):laps(4,1),2),surf_arr_L1(laps(3,1):laps(4,1),3),'ok')
plot(surf_arr_L1(laps(4,1):laps(5,1),2),surf_arr_L1(laps(4,1):laps(5,1),3),'ok')
plot(surf_arr_L1(laps(5,1):laps(6,1),2),surf_arr_L1(laps(5,1):laps(6,1),3),'ok')
plot(surf_arr_L2(:,2),surf_arr_L2(:,3),'ok')


plot(surf_arr_L1(idx_match_L1(1,1),2),surf_arr_L1(idx_match_L1(1,1),3),'or')
plot(surf_arr_L1(idx_match_L1(2,1),2),surf_arr_L1(idx_match_L1(2,1),3),'or')
plot(surf_arr_L1(idx_match_L1(3,1),2),surf_arr_L1(idx_match_L1(3,1),3),'or')
plot(surf_arr_L1(idx_match_L1(4,1),2),surf_arr_L1(idx_match_L1(4,1),3),'or')
plot(surf_arr_L1(idx_match_L1(5,1),2),surf_arr_L1(idx_match_L1(5,1),3),'or')
plot(surf_arr_L2(idx_match_L2(1,1),2),surf_arr_L2(idx_match_L2(1,1),3),'or')

axis equal
xlabel('x(m)')
ylabel('y(m)')
title('Loading')