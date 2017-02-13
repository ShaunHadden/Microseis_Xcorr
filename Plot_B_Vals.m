function [] =  Plot_B_Vals(Data1,Data2,Well_Type)

if (size(Data1(:,1),1) <15) && (size(Data2(:,1),1) <15)
return
end

n_Data1 = size(Data1(:,1),1);
n_Data2 = size(Data2(:,1),1);

Data1 = [Data1]';
Data2 = [Data2]';


Data1 = sort(Data1);
Data2 = sort(Data2);


Data1 = log(Data1);
Data2 = log(Data2);

[n1,bin1] = hist(Data1,1000);
[n2,bin2] = hist(Data2,1000);


c1 = n1;
c2 = n2;



for i = 1:length(n1)
    c1(i)= sum (n1(length(n1):-1:i));
end

for i = 1:length(n2)
    c2(i)= sum (n2(length(n2):-1:i));
end


c1 = log(c1);
c2 = log(c2);
% find slope and y intercept of b values
x=110
y=100
slopeshale=0;
while slopeshale==0
x2=240
y2=200
slopeshale=[(c1(x)-c1(y))./(bin1(x)-bin1(y))];
yintshale=c1(x)-slopeshale.*bin1(x);
if slopeshale==0
    x2=x2+10
    y2=y2+10
    end
end

slopecarb=[(c2(x2)-c2(y2))./(bin2(x2)-bin2(y2))];
yintcarb=c2(x2)-slopecarb.*bin2(x2);

%find the maximim X and Y to set the axiis
if max(bin1)>max(bin2)
    maxx=max(bin1);
else
    maxx=(bin2);
end

if max(c1)>max(c2)
    maxy=max(c1);
else
    maxy=(c2);
end

(figure )
hold on


%plot the shale and the shale B line if >10 points
      plot(bin1,c1,'.black');
     if n_Data1>10
      shaleref=refline(slopeshale,yintshale);
       set(shaleref,'Color','black');
     end
   
     
   
      
      xlabel('Source Radius (m)');
      ylabel('Log (N)');
      title(sprintf('Statistical Distribution of Source Radius by Rock Type'));
      hold on;
      plot(bin2,c2,'.blue');
       
      %Plot the carb and the B carb line if >10 point
      if n_Data2>10
      carbref=refline(slopecarb,yintcarb);
         set(carbref,'Color','blue');
     end
      
      xlim([0 ,maxx])
      ylim([0 ,maxy])

      %Set legend
      hold off
      if Well_Type == [3 1]
            legend(sprintf('Leonard A Shale (%d)',n_Data1),sprintf('Leonard A B-trend (Slope %.2f)',slopeshale),sprintf('Massive Carbonate(%d)',n_Data2),sprintf('Massive Carbonate B-trend Slope (%.2f)',slopecarb));
      end
      if Well_Type == [4 1]
            legend(sprintf('Leonard B Upper Shale (%d)',n_Data1),sprintf('Leonard B Upper B-trend Slope (%.2f)',slopecarb),sprintf('Massive Carb(%d)',n_Data2),sprintf('Massive Carb B-trend Slope (%.2f)',slopecarb));
      end
       if Well_Type == [3 2]
            legend(sprintf('Leonard A Shale (%d)',n_Data1),sprintf('Leonard A B-trend Slope (%.2f)',slopeshale),sprintf('Leonard A Carb (%d)',n_Data2),sprintf('Leonard A Carb B-trend Slope (%.2f)',slopecarb));
      end
      if Well_Type == [4 2]
            legend(sprintf('Leonard B Upper Shale (%d)',n_Data1),sprintf('Leonard B U Shale B-trend Slope (%.2f)',slopeshale),sprintf('Leonard B Carbonate (%d)',n_Data2),sprintf('Leonard B Carb B-trend Slope (%.2f)',slopecarb));
      end
      if Well_Type == 5
            legend(sprintf('All Shales (%d)',n_Data1),sprintf('All Carbonates (%d)',n_Data2));
      end

hold off
    
%output information
    if n_Data1>10
      sprintf('B value of the shale is  %.2f',slopeshale)
    
     end
     if n_Data2>10 && Well_Type(2) == [1]
      sprintf('B value of the Massive carbonate is %.2f',slopecarb)
     end  
      if n_Data2>10 && Well_Type(2) == [2]
      sprintf('B value of the Leonard carbonate is %.2f',slopecarb)
        
     end
       if (n_Data2>10)&&(n_Data1>10)
           if slopeshale<slopecarb;
      sprintf('B value in carbonate should be  Steeper than in a shale. This is not true, therefore QCing is suggested.')
           else
      sprintf('B value in carbonate should be  Steeper than in a shale. This is occuring as expected.')
           end

     


% pause(2);
% saveas(gcf,sprintf('Statistical Distribution of Moment Magnitude by Rock Type'),'png');
% close;

end
