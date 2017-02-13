function [Stage_Lnrd_A,Stage_Lnrd_A_Carb,Stage_Lnrd_A_Shale,Stage_Massive_Carb,Stage_Lnrd_B_UpperShale, ...;
 Stage_Lnrd_B_Carb,Stage_Lnrd_B_LowerShale,Stage_Way_Out,events_in_stage, events_in_next_stage,events_in_previous_stage]...;
 = formation_and_zone(Data_Locations,Formation_Information,Stage_Zone,Stage_Row,Stage_Information,Stage_Type);


%create an easier to use variable for depths of formations
Formation_Depths(1:7,1) = Formation_Information(3:9,1);
Formation_Depths(1:7,2) = Formation_Information(4:10,1);


Stage_Lnrd_A = [];
Stage_Lnrd_A_Carb = [];
Stage_Lnrd_A_Shale = [];
Stage_Massive_Carb = [];
Stage_Lnrd_B_UpperShale = [];
Stage_Lnrd_B_Carb = [];
Stage_Lnrd_B_LowerShale = [];
Stage_Way_Out = [];

n = size(Data_Locations,1);
%sort events by vertical formation
for i = 1:n
    
    if Data_Locations(i,3) > Formation_Depths(1,1) && Data_Locations(i,3) < Formation_Depths(7,2) 
    
    if Data_Locations(i,3) > Formation_Depths(1,1) && Data_Locations(i,3) < Formation_Depths(1,2) 
        
        if isempty(Stage_Lnrd_A)
            
            Stage_Lnrd_A = Data_Locations(i,1:15);
            
        else
            
           Stage_Lnrd_A = [Stage_Lnrd_A;Data_Locations(i,1:15)];
           
        end
        
    end
        
     if Data_Locations(i,3) > Formation_Depths(2,1) && Data_Locations(i,3) <= Formation_Depths(2,2) 
        
            if isempty(Stage_Lnrd_A_Carb)
                
                Stage_Lnrd_A_Carb = Data_Locations(i,1:15);
                
            else
                
                Stage_Lnrd_A_Carb = [Stage_Lnrd_A_Carb;Data_Locations(i,1:15)];
                
            end
            
     end
     
     if Data_Locations(i,3) > Formation_Depths(3,1) && Data_Locations(i,3) <= Formation_Depths(3,2) 
        
            if isempty(Stage_Lnrd_A_Shale)
                
                Stage_Lnrd_A_Shale = Data_Locations(i,1:15);
                
            else
                
                Stage_Lnrd_A_Shale = [Stage_Lnrd_A_Shale;Data_Locations(i,1:15)];
                
            end
            
     end
     
     if Data_Locations(i,3) > Formation_Depths(4,1) && Data_Locations(i,3) <= Formation_Depths(4,2) 
        
            if isempty(Stage_Massive_Carb)
                
                Stage_Massive_Carb = Data_Locations(i,1:15);
                
            else
                
                Stage_Massive_Carb = [Stage_Massive_Carb;Data_Locations(i,1:15)];
                
            end
            
     end
     
       if Data_Locations(i,3) > Formation_Depths(5,1) && Data_Locations(i,3) <= Formation_Depths(5,2) 
        
            if isempty(Stage_Lnrd_B_UpperShale)
                
                Stage_Lnrd_B_UpperShale = Data_Locations(i,1:15);
                
            else
                
                Stage_Lnrd_B_UpperShale = [Stage_Lnrd_B_UpperShale;Data_Locations(i,1:15)];
                
            end
            
       end
     
        if Data_Locations(i,3) > Formation_Depths(6,1) && Data_Locations(i,3) <= Formation_Depths(6,2) 
        
            if isempty(Stage_Lnrd_B_Carb)
                
                Stage_Lnrd_B_Carb = Data_Locations(i,1:15);
                
            else
                
                Stage_Lnrd_B_Carb = [Stage_Lnrd_B_Carb;Data_Locations(i,1:15)];
                
            end
            
        end
    
           if Data_Locations(i,3) > Formation_Depths(7,1) && Data_Locations(i,3) <= Formation_Depths(7,2) 
        
            if isempty(Stage_Lnrd_B_LowerShale)
                
               Stage_Lnrd_B_LowerShale = Data_Locations(i,1:15);
                
            else
                
                Stage_Lnrd_B_LowerShale = [Stage_Lnrd_B_LowerShale;Data_Locations(i,1:15)];
                
            end
            
           end
     
    else
       
        if isempty(Stage_Way_Out)
                
               Stage_Way_Out = Data_Locations(i,1:15);
                
            else
                
                Stage_Way_Out = [Stage_Way_Out;Data_Locations(i,1:15)];
                
            end
        
    end
end
if (Stage_Type ==3)
events_in_zone=[Stage_Lnrd_A_Shale];
events_out_of_zone=[Stage_Lnrd_B_UpperShale;Stage_Way_Out;Stage_Lnrd_B_LowerShale;Stage_Lnrd_B_Carb;  Stage_Massive_Carb;Stage_Lnrd_A_Carb;Stage_Lnrd_A];

else
    events_in_zone=[Stage_Lnrd_B_UpperShale];
events_out_of_zone=[Stage_Lnrd_A_Shale;Stage_Way_Out;Stage_Lnrd_B_LowerShale;Stage_Lnrd_B_Carb;  Stage_Massive_Carb;Stage_Lnrd_A_Carb;Stage_Lnrd_A];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lateral Distance


%Define the slope and intercept line representing the stage, from y=mx+b in 2 dimensions

m_stage=(Stage_Zone(Stage_Row,2)/(Stage_Zone(Stage_Row,1)));
b=Stage_Information(Stage_Row,2)-m_stage.*(Stage_Information(Stage_Row,1));
stage_line=[m_stage,b];


% m and b for line segment representing the previous stage end

m_dividing=-1./m_stage;
b_old_end=Stage_Information(Stage_Row-1,5)-m_dividing.*(Stage_Information(Stage_Row-1,4));
stage_old_end=[m_dividing, b_old_end];

% m and b flor line segment representing the previous stage mid gap

m_dividing=m_dividing;
b_old_dividing=(Stage_Information(Stage_Row-1,5)+((Stage_Information(Stage_Row,2)-Stage_Information(Stage_Row-1,5))./2)) ...;
    -m_dividing.*(Stage_Information(Stage_Row-1,4)+((Stage_Information(Stage_Row,1)-Stage_Information(Stage_Row-1,4))./2));
stage_old_dividing=[m_dividing, b_old_dividing];

% m and b flor line segment representing the stage start

m_dividing=m_dividing;
b_start=Stage_Information(Stage_Row,2)-m_dividing.*(Stage_Information(Stage_Row,1));
stage_start=[m_dividing, b_start];


% m and b flor line segment representing the stage end

m_dividing=m_dividing;
b_end=Stage_Information(Stage_Row,5)-m_dividing.*(Stage_Information(Stage_Row,4));
stage_end=[m_dividing, b_end];

% m and b flor line segment representing the middle of the stage gap to the
% next stage

m_dividing=m_dividing;
b_gap=(Stage_Information(Stage_Row,5)+((Stage_Information(Stage_Row+1,2)-Stage_Information(Stage_Row,5))./2)) ...;
    -m_dividing.*(Stage_Information(Stage_Row,4)+((Stage_Information(Stage_Row+1,1)-Stage_Information(Stage_Row,4))./2));
stage_gap=[m_dividing, b_gap];

% m and b flor line segment representing the start of the next stage 

m_dividing=m_dividing;
b_start_next_stage=Stage_Information(Stage_Row+1,2)-m_dividing.*(Stage_Information(Stage_Row+1,1));
stage_next=[m_dividing, b_start_next_stage];

events_in_stage=[];
events_in_previous_stage=[];
events_in_next_stage=[];


for i=1:length(Data_Locations)
    
    %within stage if between start and end line.
   
    if Data_Locations(i,2)>(m_dividing.*Data_Locations(i,1)+b_old_dividing)
    events_in_previous_stage=[events_in_previous_stage;Data_Locations(i,:)];
 
    end
    
    
    if Data_Locations(i,2)>(m_dividing.*Data_Locations(i,1)+b_old_dividing) && Data_Locations(i,2) >(m_dividing.*Data_Locations(i,1)+b_gap)
    
    events_in_stage=[events_in_stage;Data_Locations(i,:)];

    end
    
    
    if Data_Locations(i,2)<(m_dividing.*Data_Locations(i,1)+b_gap) 
    
    events_in_next_stage=[events_in_next_stage;Data_Locations(i,:)];

    end
  
    
end

lateral_out_of_stage= [events_in_next_stage;events_in_previous_stage];
plot_events(Data_Locations,stage_old_dividing,stage_start,stage_end,stage_gap,stage_line,Stage_Type,Formation_Information,Stage_Row,Stage_Information);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sprintf('Total Events: %d. Preliminary estmates for: Leonard A - %d, Leonard A Carb - %d,', size(Data_Locations,1),size(Stage_Lnrd_A ,1),size(Stage_Lnrd_A_Carb,1))
   sprintf( ' Leonard A Shale - %d, Massive Carb, %d Leonard B uppershale - %d, Leonard B Carb - %d, Way Out - %d.', size(Stage_Lnrd_A_Shale,1),size(Stage_Massive_Carb,1),size(Stage_Lnrd_B_UpperShale,1),size(Stage_Lnrd_B_Carb,1), size(Stage_Way_Out,1))

sprintf('Preliminary estimate of number of events in vertical zone: %d. Out of zone vertical: %d. Percentage in zone: %.2f',size(events_in_zone,1),size(events_out_of_zone,1),((size(events_in_zone,1)./(size(events_in_zone,1)+size(events_out_of_zone,1)).*100)))

sprintf('Current stage length is %.2f feet. This stage started %.2f feet from the last stage.',Stage_Zone(Stage_Row,1),(Stage_Zone(Stage_Row,2)))

sprintf('Preliminary estimate of number of events in lateral zone: %d. Out of zone lateral: %d. Percentage in zone: %.2f'...
,size(events_in_stage,1),(size(lateral_out_of_stage,1)),((size(events_in_stage,1)./(size(events_in_stage,1)+size(lateral_out_of_stage,1)).*100)))

if ((size(events_in_stage,1)./(size(events_in_stage,1)+size(lateral_out_of_stage,1)).*100))>25
    sprintf('Lateral overlap is significant. Consider increasing stage spacing.')

    
    
    
    
    
    
end


     