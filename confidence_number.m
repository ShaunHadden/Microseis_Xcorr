function [All_error,LBC_error,LAC_error,LAS_error,MC_error,LBU_error]=confidence_number...
  (LAC_qc,LAS_qc,MC_qc,LBU_qc,LBC_qc,Data_Locations,Stage_Information);

All_Data=zeros(size(Data_Locations,1),6);
All_Data(:,1:3)=Data_Locations(:,1:3);
All_Data(:,4:6)=Data_Locations(:,13:15);


    for i=1:6

        if i==1
            formation=LAC_qc;
        end
        if i==2
            formation=LAS_qc;
        end
        if i==3
            formation=MC_qc;
        end
        if i==4
            formation=LBU_qc;
        end
        if i==5
            formation=LBC_qc;
        end
        if i==6
            formation=All_Data;
        end



        error_values=zeros(size(formation,1),6);

        for j=1:size(formation,1)
            %northing easting and depth error
            if isnan(formation(j,1))
                %location
                error_values(j,1) = formation(j,7);
                error_values(j,2)= formation(j,8);
                error_values(j,3)=formation(j,9);
                %vertical, lateral, and total error
                error_values(j,4)=(formation(j,12));
                error_values(j,5)=(formation(j,10).*formation(j,11)).^.5;
                error_values(j,6)=(formation(j,10).*formation(j,11).*formation(j,12)).^(1./3);


            else
                %location
                error_values(j,1) = formation(j,1);
                error_values(j,2)= formation(j,2);
                error_values(j,3)=formation(j,3);
                %vertical, lateral, and total error
                error_values(j,4)=(formation(j,6));
                error_values(j,5)=(formation(j,4).*formation(j,5)).^.5;
                error_values(j,6)=(formation(j,4).*formation(j,5).*formation(j,6)).^(1./3);

            end

        end
        if i==1
            LAC_error=error_values(:,:);
        end
        if i==2
            LAS_error=error_values;
        end
        if i==3
            MC_error=error_values;
        end
        if i==4
            LBU_error=error_values;
        end
        if i==5
            LBC_error=error_values;
        end
        if i==6
            All_error=error_values;
        end


    end
    
    sprintf('Formation thicknesses are as follows in feet: Leonard A Carb: %.1f, Leonard A Shale: %.1f, Massive Carb: %.1f, Leonard B UpperShale: %.1f, Leonard B Carb: %.1f' ...
      ,abs(Stage_Information(5)-Stage_Information(4)),abs(Stage_Information(6)-Stage_Information(5)),abs(Stage_Information(7)-Stage_Information(6)),abs(Stage_Information(8)-Stage_Information(7)),abs(Stage_Information(9)-Stage_Information(8)))    
   
  if size(All_error,1)>0
    sprintf('Average error for All Events - Vertical: %.1f feet. Lateral: %.1f feet. Total error %.1f feet'...
    ,mean(All_error(:,4)),mean(All_error(:,5)),mean(All_error(:,6)))
   end
   
   if size(LAC_error,1)>0
    sprintf('Average error for QC Leonard A Carb- Vertical: %.1f feet. Lateral: %.1f feet. Total error %.1f feet'...
    ,mean(LAC_error(:,4)),mean(LAC_error(:,5)),mean(LAC_error(:,6)))
   end
   
   if size(LAS_error,1)>0
sprintf('Average error for QC Leonard A Shale- Vertical: %.1f feet. Lateral: %.1f feet. Total error %.1f feet'...
    ,mean(LAS_error(:,4)),mean(LAS_error(:,5)),mean(LAS_error(:,6)))
   end
   
   if size(MC_error,1)>0
sprintf('Average error for QC Massive Carb- Vertical: %.1f feet. Lateral: %.1f feet. Total error %.1f feet'...
    ,mean(MC_error(:,4)),mean(MC_error(:,5)),mean(MC_error(:,6)))
   end
   
   if size(LBU_error,1)>0
sprintf('Average error for QC Leonard B Upper Shale- Vertical: %.1f feet. Lateral: %.1f feet. Total error %.1f feet'...
    ,mean(LBU_error(:,4)),mean(LBU_error(:,5)),mean(LBU_error(:,6)))
   end
   
   if size(LBC_error,1)>0
sprintf('Average error for QC Leonard B Carb- Vertical: %.1f feet. Lateral: %.1f feet. Total error %.1f feet'...
    ,mean(LBC_error(:,4)),mean(LBC_error(:,5)),mean(LBC_error(:,6)))
   end
end
