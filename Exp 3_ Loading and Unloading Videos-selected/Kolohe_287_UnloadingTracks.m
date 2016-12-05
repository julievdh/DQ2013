load KoloheUnloading_287

laps = [1 120 240 332 432 522 593]';  

    
figure
plot(surf_arr(laps(1,1):laps(2,1),2),surf_arr(laps(1,1):laps(2,1),3),'ok')
hold on
plot(surf_arr(laps(2,1):laps(3,1),2),surf_arr(laps(2,1):laps(3,1),3),'ok')
plot(surf_arr(laps(3,1):laps(4,1),2),surf_arr(laps(3,1):laps(4,1),3),'ok')
plot(surf_arr(laps(4,1):laps(5,1),2),surf_arr(laps(4,1):laps(5,1),3),'ok')
plot(surf_arr(laps(5,1):laps(6,1),2),surf_arr(laps(5,1):laps(6,1),3),'ok')
plot(surf_arr(laps(6,1):laps(7,1),2),surf_arr(laps(6,1):laps(7,1),3),'ok')


plot(surf_arr(idx_match(1,1),2),surf_arr(idx_match(1,1),3),'or')
plot(surf_arr(idx_match(2,1),2),surf_arr(idx_match(2,1),3),'or')
plot(surf_arr(idx_match(3,1),2),surf_arr(idx_match(3,1),3),'or')
plot(surf_arr(idx_match(4,1),2),surf_arr(idx_match(4,1),3),'or')
plot(surf_arr(idx_match(5,1),2),surf_arr(idx_match(5,1),3),'or')
plot(surf_arr(idx_match(6,1),2),surf_arr(idx_match(6,1),3),'or')


axis equal
xlabel('x(m)')
ylabel('y(m)')
title('Unloading')