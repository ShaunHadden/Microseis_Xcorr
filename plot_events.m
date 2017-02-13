function plot_events(Data_Locations,stage_old_dividing,stage_start,stage_end,stage_gap,stage_line,Stage_Type,Formation_Information,Stage_Row,Stage_Information)

(figure)
hold on

title(sprintf('events in the Northing/Easting Plane'));
xlabel('Northing');
ylabel('Easting');


plot (Data_Locations(:,1),Data_Locations(:,2),'.')
oldborder=refline(stage_old_dividing);
refline(stage_start);
refline(stage_end);
newborder=refline(stage_gap);
stage= refline(stage_line);
set(stage,'Color','black');
set(newborder,'Color','red');
set(oldborder,'Color','red');
axis tight;

ylim([min(Data_Locations(:,2)),max(Data_Locations(:,2))]);
xlim([min(Data_Locations(:,1)),max(Data_Locations(:,1))]);
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
(figure)
hold on 
 
title(sprintf('Vertical Distance from centre'));
xlabel('Northing/Easting');
set(gca,'YDir','reverse');
ylabel('Depth');

easting_northing=(Data_Locations(:,2)./Data_Locations(:,1));
plot (easting_northing(:),Data_Locations(:,3),'.')

%x,y of start


plot([min(easting_northing), max(easting_northing)],[Formation_Information(4),Formation_Information(4)],'Color','b','LineWidth',2);
plot([min(easting_northing), max(easting_northing)],[Formation_Information(9),Formation_Information(9)],'Color','b','LineWidth',2);

if Stage_Type==3
plot([min(easting_northing), max(easting_northing)],[Formation_Information(5),Formation_Information(5)],'Color','black','LineWidth',2);
plot([min(easting_northing), max(easting_northing)],[Formation_Information(6),Formation_Information(6)],'Color','black','LineWidth',2);
plot([min(easting_northing), max(easting_northing)],[Formation_Information(7),Formation_Information(7)],'Color','b','LineWidth',2);
plot([min(easting_northing), max(easting_northing)],[Formation_Information(8),Formation_Information(8)],'Color','b','LineWidth',2);
else
plot([min(easting_northing), max(easting_northing)],[Formation_Information(5),Formation_Information(5)],'Color','b','LineWidth',2);
plot([min(easting_northing), max(easting_northing)],[Formation_Information(6),Formation_Information(6)],'Color','b','LineWidth',2);
plot([min(easting_northing), max(easting_northing)],[Formation_Information(7),Formation_Information(7)],'Color','black','LineWidth',2);
plot([min(easting_northing), max(easting_northing)],[Formation_Information(8),Formation_Information(8)],'Color','black','LineWidth',2);
end
hold off 
