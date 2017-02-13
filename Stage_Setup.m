function [ Formation_Boundaries, Stage_Center,Data_Locations,neighbour_shales,neighbour_carbonates]=Stage_Setup (Stage_Type,Formation_Information, event_data)

%Run the first if, if in the upper shale.
%neighbour carbonates 1 and 2 are the upper and lower boundary of one unit,
%and 3 and 4 of a second unit. Same for shales. 
if (Stage_Type==3)
    Formation_Boundaries = [Formation_Information(5,1) Formation_Information(6,1) Formation_Information(11,1)];
    Stage_Center = [Formation_Information(13,1) Formation_Information(14,1) Formation_Information(11,1)];
    neighbour_carbonates=[Formation_Information(4,1) Formation_Information(5,1) Formation_Information(6,1) Formation_Information(7,1)];
    neighbour_shales=[Formation_Information(3,1) Formation_Information(4,1) Formation_Information(7,1) Formation_Information(8,1)];
else
    Formation_Boundaries = [Formation_Information(7,1) Formation_Information(8,1) Formation_Information(12,1)];
    Stage_Center = [Formation_Information(13,1) Formation_Information(14,1) Formation_Information(12,1)];
    neighbour_carbonates=[Formation_Information(6,1) Formation_Information(7,1) Formation_Information(8,1) Formation_Information(9,1)];
    neighbour_shales=[Formation_Information(5,1) Formation_Information(6,1) Formation_Information(9,1) Formation_Information(10,1)];
end


    Data_num_rows = length(event_data);
     Data_Locations = zeros(Data_num_rows,15);
    
    temp_times = zeros(Data_num_rows,6);
    
    %Data_Locations will consist of 6 columns. Northing, Easting, Depth,
    %time, Distance from stage centre, and vertical distance from stage
    %centre (the last two are solved in a seperate function)
    
    %4 source paramaters are source ro, moment, stress, magnitude.
    
        for i=1:Data_num_rows

            Data_Locations(i,1) = event_data(i).N;
            Data_Locations(i,2)= event_data(i).E;
            Data_Locations(i,3)=event_data(i).Z;
           
            Data_Locations(i,5)=event_data(i).MomMag;     
            Data_Locations(i,6)=event_data(i).SourceRo;
             Data_Locations(i,7)=event_data(i).SeiMoment;
            Data_Locations(i,8)=event_data(i).AppStress;
             Data_Locations(i,9)=event_data(i).Energy;
             Data_Locations(i,10)=event_data(i).Displacement;
             Data_Locations(i,11)=event_data(i).StaticStress;
             Data_Locations(i,12)=event_data(i).EsEp;
            
             Data_Locations(i,13)=event_data(i).Ne;
             Data_Locations(i,14)=event_data(i).Ee;
             Data_Locations(i,15)=event_data(i).Ze;
             
            temp_times(i,:) = datevec(event_data(i).datetime);
           
        end


    Data_Locations(:,4) = datenum(temp_times)./(10^3);

end