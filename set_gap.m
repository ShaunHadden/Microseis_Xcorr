function [b_ideal]=  set_gap(b_gap,events_in_stage,lateral_out_of_stage, m_dividing,Data_Locations,b_old_dividing)


events_in_stage=[];
events_in_previous_stage=[];
events_in_next_stage=[];


if (size(events_in_stage,1)./(size(events_in_stage,1)+size(lateral_out_of_stage,1)).*100) >10

    

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
b_gap=b_gap+1;
end
b_ideal=b_gap;
end
