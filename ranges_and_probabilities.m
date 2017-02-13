function [LAC_qc,LAS_qc,MC_qc,LBU_qc,LBC_qc]=ranges_and_probabilities (Stage_Type,Stage_Lnrd_A_Carb, ...
Stage_Lnrd_A_Shale,Stage_Massive_Carb, Stage_Lnrd_B_UpperShale,Stage_Lnrd_B_Carb,filename);


%input expected ranges for each formation from a document
normal_ranges=xlsread('Ranges_and_Probabilities.xlsx');

%create empty variables to fill with results

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%stresses
LAC_app=NaN(size(Stage_Lnrd_A_Carb,1),6);
LA_stat=NaN(size(Stage_Lnrd_A_Carb,1),6);
LAS_app=NaN(size(Stage_Lnrd_A_Shale,1),6);
LAS_stat=NaN(size(Stage_Lnrd_A_Shale,1),6);
MC_app=NaN(size(Stage_Massive_Carb,1),6);
MC_stat=NaN(size(Stage_Massive_Carb,1),6);
LBU_app=NaN(size(Stage_Lnrd_B_UpperShale,1),6);
LBU_stat=NaN(size(Stage_Lnrd_B_UpperShale,1),6);
LBC_app=NaN(size(Stage_Lnrd_B_Carb,1),6);
LBC_stat=NaN(size(Stage_Lnrd_B_Carb,1),6);

for i =1:size(Stage_Lnrd_A_Carb,1)

    if log(Stage_Lnrd_A_Carb(i,8))<(normal_ranges(1,1)-normal_ranges(1,2)) || log(Stage_Lnrd_A_Carb(i,8))> normal_ranges(1,1)+normal_ranges(1,2)

            LAC_app(i,1:3)=Stage_Lnrd_A_Carb(i,1:3);
            LAC_app(i,4:6)=Stage_Lnrd_A_Carb(i,13:15);

        else
            LAC_app(i,1)=NaN;
        end

         if log(Stage_Lnrd_A_Carb(i,11))<(normal_ranges(2,1)-normal_ranges(2,2)) || log(Stage_Lnrd_A_Carb(i,11))> normal_ranges(2,1)+normal_ranges(2,2)
            LA_stat(i,1:3)=Stage_Lnrd_A_Carb(i,1:3);
                LA_stat(i,4:6)=Stage_Lnrd_A_Carb(i,13:15);
              else
            LA_stat(i,1)=NaN;
         end
    end



for i =1:size(Stage_Lnrd_A_Shale,1)
if log(Stage_Lnrd_A_Shale(i,8))<(normal_ranges(1,3)-normal_ranges(1,4)) && log(Stage_Lnrd_A_Shale(i,8))> normal_ranges(1,3)+normal_ranges(1,4)
       LAS_app(i,1)=Stage_Lnrd_A_Shale(i,1);
        LAS_app(i,2)=Stage_Lnrd_A_Shale(i,2);
        LAS_app(i,3)=Stage_Lnrd_A_Shale(i,3);
         LAS_app(i,4)=Stage_Lnrd_A_Shale(i,13);
        LAS_app(i,5)=Stage_Lnrd_A_Shale(i,14);
        LAS_app(i,6)=Stage_Lnrd_A_Shale(i,15);
    else
        LAS_app(i,1)=NaN;
    end
    
    
     if log(Stage_Lnrd_A_Shale(i,11))<(normal_ranges(2,3)-normal_ranges(2,4)) && log(Stage_Lnrd_A_Shale(i,11))> normal_ranges(2,3)+normal_ranges(2,4)
         LAS_stat(i,1)=Stage_Lnrd_A_Shale(i,1);
        LAS_stat(i,2)=Stage_Lnrd_A_Shale(i,2);
        LAS_stat(i,3)=Stage_Lnrd_A_Shale(i,3);
           LAS_stat(i,4)=Stage_Lnrd_A_Shale(i,13);
        LAS_stat(i,5)=Stage_Lnrd_A_Shale(i,14);
        LAS_stat(i,6)=Stage_Lnrd_A_Shale(i,15);
    else
        LAS_stat(i,1)=NaN;
    end
     
end



for i =1:size(Stage_Massive_Carb,1) 

if log(Stage_Massive_Carb(i,8))<(normal_ranges(1,5)-normal_ranges(1,6)) || log(Stage_Massive_Carb(i,8))> normal_ranges(1,5)+normal_ranges(1,6)
        MC_app(i,1)=Stage_Massive_Carb(i,1);
        MC_app(i,2)=Stage_Massive_Carb(i,2);
        MC_app(i,3)=Stage_Massive_Carb(i,3);
         MC_app(i,4)=Stage_Massive_Carb(i,13);
        MC_app(i,5)=Stage_Massive_Carb(i,14);
        MC_app(i,6)=Stage_Massive_Carb(i,15);
    else
        MC_app(i,1)=NaN;
    end
    
    
     if log(Stage_Massive_Carb(i,11))<(normal_ranges(2,5)-normal_ranges(2,6)) || log(Stage_Massive_Carb(i,11))> normal_ranges(2,5)+normal_ranges(2,6)
        MC_stat(i,1)=Stage_Massive_Carb(i,1);
        MC_stat(i,2)=Stage_Massive_Carb(i,2);
        MC_stat(i,3)=Stage_Massive_Carb(i,3);
        MC_stat(i,4)=Stage_Massive_Carb(i,13);
        MC_stat(i,5)=Stage_Massive_Carb(i,14);
        MC_stat(i,6)=Stage_Massive_Carb(i,15);
    else
        MC_stat(i,1)=NaN;
    end
      
end



for i =1:size(Stage_Lnrd_B_UpperShale,1)
 
  if log(Stage_Lnrd_B_UpperShale(i,8))<(normal_ranges(1,6)-normal_ranges(1,7)) ||log(Stage_Lnrd_B_UpperShale (i,8))> normal_ranges(1,6)+normal_ranges(1,7)
            LBU_app(i,1)=Stage_Lnrd_B_UpperShale(i,1);
        LBU_app(i,2)=Stage_Lnrd_B_UpperShale(i,2);
        LBU_app(i,3)=Stage_Lnrd_B_UpperShale(i,3);
          LBU_app(i,4)=Stage_Lnrd_B_UpperShale(i,13);
        LBU_app(i,5)=Stage_Lnrd_B_UpperShale(i,14);
        LBU_app(i,6)=Stage_Lnrd_B_UpperShale(i,15);
    else
        LBU_app(i,1)=NaN;
  end
  
  if log(Stage_Lnrd_B_UpperShale(i,11))<(normal_ranges(2,6)-normal_ranges(2,7)) ||log(Stage_Lnrd_B_UpperShale (i,11))> normal_ranges(2,6)+normal_ranges(2,7)
           LBU_stat(i,1)=Stage_Lnrd_B_UpperShale(i,1);
        LBU_stat(i,2)=Stage_Lnrd_B_UpperShale(i,2);
        LBU_stat(i,3)=Stage_Lnrd_B_UpperShale(i,3);
         LBU_stat(i,4)=Stage_Lnrd_B_UpperShale(i,13);
        LBU_stat(i,5)=Stage_Lnrd_B_UpperShale(i,14);
        LBU_stat(i,6)=Stage_Lnrd_B_UpperShale(i,15);
    else
        LBU_stat(i,1)=NaN;
    end
     
end



for i =1:size(Stage_Lnrd_B_Carb,1)
   if log(Stage_Lnrd_B_Carb(i,8))<(normal_ranges(1,8)-normal_ranges(1,9)) && iflog(Stage_Lnrd_B_Carb(i,8))> normal_ranges(1,8)+normal_ranges(1,9)
          LBC_app(i,1)=Stage_Lnrd_B_Carb(i,1);
        LBC_app(i,2)=Stage_Lnrd_B_Carb(i,2);
        LBC_app(i,3)=Stage_Lnrd_B_Carb(i,3);
          LBC_app(i,4)=Stage_Lnrd_B_Carb(i,13);
        LBC_app(i,5)=Stage_Lnrd_B_Carb(i,14);
        LBC_app(i,6)=Stage_Lnrd_B_Carb(i,15);
    else
        LBC_app(i,1)=NaN;
    end
     
    
     if log(Stage_Lnrd_B_Carb(i,11))<(normal_ranges(2,8)-normal_ranges(2,9)) && log(Stage_Lnrd_B_Carb(i,11))> normal_ranges(2,8)+normal_ranges(2,9)
             LBC_stat(i,1)=Stage_Lnrd_B_Carb(i,1);
        LBC_stat(i,2)=Stage_Lnrd_B_Carb(i,2);
        LBC_stat(i,3)=Stage_Lnrd_B_Carb(i,3);
         LBC_stat(i,4)=Stage_Lnrd_B_Carb(i,13);
        LBC_stat(i,5)=Stage_Lnrd_B_Carb(i,14);
        LBC_stat(i,6)=Stage_Lnrd_B_Carb(i,15);
    else
        LBC_stat(i,1)=NaN;
    end
     
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%B Values of source radius


if Stage_Type==3
%first compare shale and carb above
Well_Type=[Stage_Type,1];
Plot_B_Vals(Stage_Lnrd_A_Shale(:,6),Stage_Massive_Carb(:,6),Well_Type)

%then shale and carb below
Well_Type=[Stage_Type,2];

Plot_B_Vals(Stage_Lnrd_A_Shale(:,6),Stage_Lnrd_A_Carb(:,6),Well_Type)

else 

%first compare shale and carb above
Well_Type=[Stage_Type,1];
Plot_B_Vals(Stage_Lnrd_B_UpperShale(:,6),Stage_Massive_Carb(:,6),Well_Type)

%then shale and carb below
Well_Type=[Stage_Type,2];
Plot_B_Vals(Stage_Lnrd_B_UpperShale(:,6),Stage_Lnrd_B_Carb(:,6),Well_Type)

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot Log normal CDP

for j=1:2
    xx=[];
    if j==1
        xx=8;
    end
    if j==2
        xx=11;
    end
   
if Stage_Type==3
%first compare shale and carb above
Well_Type=[Stage_Type,1];
[mean_val1] =  Plot_Log_Norm_PDFS(Stage_Lnrd_A_Shale(:,xx),Stage_Massive_Carb(:,xx),Well_Type,normal_ranges,xx);

%then shale and carb below
Well_Type=[Stage_Type,2];
[mean_val2] =  Plot_Log_Norm_PDFS(Stage_Lnrd_A_Shale(:,xx),Stage_Lnrd_A_Carb(:,xx),Well_Type,normal_ranges,xx);

else 

%first compare shale and carb above
Well_Type=[Stage_Type,1];
[mean_val1] =  Plot_Log_Norm_PDFS(Stage_Lnrd_B_UpperShale(:,xx),Stage_Massive_Carb(:,xx),Well_Type,normal_ranges,xx);

%then shale and carb below
Well_Type=[Stage_Type,2];
[mean_val2] =  Plot_Log_Norm_PDFS(Stage_Lnrd_B_UpperShale(:,xx),Stage_Lnrd_B_Carb(:,xx),Well_Type,normal_ranges,xx);

end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   LAC_qc= [LAC_app LA_stat];
    LAC_qc=LAC_qc(any(LAC_qc,2),:);

   LAS_qc= [LAS_app LAS_stat ];
   LAS_qc=LAS_qc(any(LAS_qc,2),:);

   MC_qc= [MC_app MC_stat];
   MC_qc=MC_qc(any(MC_qc,2),:);

   LBU_qc= [LBU_app  LBU_stat];
   LBU_qc=LBU_qc(any(LBU_qc,2),:);

   LBC_qc= [LBC_app LBC_stat];
   LBC_qc=LBC_qc(any(LBC_qc,2),:);

 if size(LAC_qc,1)>0
     sprintf('consider QCing %d event(s) in Leonard A Carb. Locations saved in Excel.',size(LAC_qc,1))
 else
          sprintf('All Leonard A Carb events have source paramaters within a reasonable range.')
 end
 
  if size(LAS_qc,1)>0
     sprintf('consider QCing %d event(s) in Leonard A Shale. Locations saved in Excel.',size(LAS_qc,1))
 else
          sprintf('All Leonard A Shale events have source paramaters within a reasonable range.')
 end
 if size(MC_qc,1)>0
     sprintf('consider QCing %d event(s) in Massive Carbonate. Locations saved in Excel.',size(MC_qc,1))
 else
          sprintf('All Massic Carbonate events have source paramaters within a reasonable range.')
 end
 if size(LBU_qc,1)>0
     sprintf('consider QCing %d event(s) in Leonard B Upper Shale. Locations saved in Excel.',size(LBU_qc,1))
 else
          sprintf('All Leonard B Upper Shale events have source paramaters within a reasonable range.')
 end
 if size(LBC_qc,1)>0
     sprintf('consider QCing %d event(s) in Leonard B Carb. Locations saved in Excel.',size(LBC_qc,1))
 else
          sprintf('All Leonard B Carb events have source paramaters within a reasonable range.')
 end
columns={'Northing app stress','Easting app stress','Depth app stress','N error','E error', 'D error',...
    'Northing stat stress','Easting stat stress','Depth stat stress','N error','E error', 'D error'};
 
% 
% 
 xlswrite (['Leonard A Carb events to QC from Source Paramaters ' sprintf('%s',filename)],LAC_qc,'sheet1','A2')
   xlswrite (['Leonard A Shale events to QC from Source Paramaters ' sprintf('%s',filename)],LAC_qc,'sheet1','A2')
%  xlswrite (['Massive Carb events to QC from Source Paramaters ' sprintf('%s',filename)],LAC_qc,'sheet1','A2')
%  xlswrite (['Leonard B Upper Shale events to QC from Source Paramaters ' sprintf('%s',filename)],LAC_qc,'sheet1','A2')
%   xlswrite (['Leonard B Carb events to QC from Source Paramaters ' sprintf('%s',filename)],LAC_qc,'sheet1','A2')
%    xlswrite (['All events to QC from Source Paramaters ' sprintf('%s',filename)],LAC_qc,'sheet1','A2')
%    
%     xlswrite (['Leonard A Carb events to QC from Source Paramaters ' sprintf('%s',filename)],columns,'sheet1','A1')
%   xlswrite (['Leonard A Shale events to QC from Source Paramaters ' sprintf('%s',filename)],columns,'sheet1','A1')
%  xlswrite (['Massive Carb events to QC from Source Paramaters ' sprintf('%s',filename)],columns,'sheet1','A1')
%  xlswrite (['Leonard B Upper Shale events to QC from Source Paramaters ' sprintf('%s',filename)],columns,'sheet1','A1')
%   xlswrite (['Leonard B Carb events to QC from Source Paramaters ' sprintf('%s',filename)],columns,'sheet1','A1')
%    xlswrite (['All events to QC from Source Paramaters ' sprintf('%s',filename)],columns,'sheet1','A1')

end