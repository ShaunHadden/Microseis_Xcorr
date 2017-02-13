function [mean_val] =  Plot_Log_Norm_PDFS(Data1,Data2,Well_Type, normal_ranges,xx)

if (size(Data1(:,1),1) <15) && (size(Data2(:,1),1) <15)
return
end

if xx==8
    stress='apparent stress';
end
if xx==11
    stress='stress drop';
end

mean_val = zeros(1,5);

Expected_Vals = zeros(2,2);

n_Data1 = size(Data1(:,1),1);
n_Data2 = size(Data2(:,1),1);

Data1 = log(Data1);
Data2 = log(Data2);

mu1 = zeros(n_Data1,1);
mu2 = zeros(n_Data2,1);

sigma1 = zeros(n_Data1,1);
sigma2 = zeros(n_Data2,1);

mu1(:) = mean(Data1);
Expected_Vals(1,1) = mean(Data1);


mean_val(1,1) = mu1(1,1);

mu2(:) = mean(Data2);
Expected_Vals(2,1) = mean(Data2);

mean_val(1,2) = mu2(1,1);

mean_val(1,3) = mean_val(1,2)./mean_val(1,1);

mean_val(1,4) = n_Data1;
mean_val(1,5) = n_Data2;

sigma1(:) = std(Data1);
Expected_Vals(1,2) = std(Data1);

sigma2(:) = std(Data2);
Expected_Vals(2,2) = std(Data2);


p1 = pdf('Normal',Data1,mu1,sigma1);
p2 = pdf('Normal',Data2,mu2,sigma2);

(figure)
      plot(Data1,p1,'.r');
      xlabel(sprintf(' %s (Pa)',stress));
      ylabel('P(x)');
      title(sprintf('LogNormal PDF of %s by Rock Type', stress));
      hold on;
      plot(Data2,p2,'.k');
      hold off
      
      
      

    
      
      if Well_Type == [3 1]
            legend(sprintf('Leonard A Shale (%d)',n_Data1),sprintf('Massive Carbonate (%d)',n_Data2));
                  sprintf(' ratio of massive carbonate %s to Lnrd A shale %s is %.2f',stress,stress ,mean_val(3)')
                 if (xx==8);
                  if mean_val(3)>(normal_ranges(3,1).*.1+(normal_ranges(3,1))) || mean_val(3)<((normal_ranges(3,1)-normal_ranges(3,1).*.1))
                       sprintf(' ratio of massive carbonate %s to Lnrd A shale %s is outside the expected range. QCing results is reccomended', stress,stress)
                  else 
                 sprintf(' ratio of massive carbonate %s to Lnrd A shale %s is in the expected range.', stress,stress)

                  end
                 end
                 
                 if (xx==11);
                  if mean_val(3)>(normal_ranges(4,1).*.1+(normal_ranges(4,1))) || mean_val(3)<((normal_ranges(4,1))-normal_ranges(4,1).*.1)
                       sprintf(' ratio of massive carbonate %s to Lnrd A shale %s is outside the expected range. QCing results is reccomended', stress,stress)
                  else 
                 sprintf(' ratio of massive carbonate %s to Lnrd A shale %s is in the expected range.', stress,stress)

                  end
                 end
      end
      if Well_Type == [4 1]
            legend(sprintf('Leonard B Upper Shale (%d)',n_Data1),sprintf('Massive Carbonate (%d)',n_Data2));
                  sprintf(' ratio of massive carbonate %s to Lnrd A shale %s is %.2f', stress,stress,mean_val(3)')
if xx==8;
                  if mean_val(3)>(normal_ranges(3,1).*.1+(normal_ranges(3,1))) || mean_val(3)<(normal_ranges(3,1)-normal_ranges(3,1).*.1)
                       sprintf(' ratio of massive carbonate %s to Lnrd A Upper shale %s is outside the expected range. QCing results is reccomended', stress,stress)
                  else 
                 sprintf(' ratio of massive carbonate %s to Lnrd A Upper shale %s is in the expected range.', stress,stress)

                  end
                  if (xx==11);
                  if mean_val(3)>(normal_ranges(4,1).*.1+(normal_ranges(4,1))) || mean_val(3)<((normal_ranges(4,1)-normal_ranges(4,1).*.1))
                       sprintf(' ratio of massive carbonate %s to Lnrd A Upper shale %s is outside the expected range. QCing results is reccomended', stress,stress)
                  else 
                 sprintf(' ratio of massive carbonate %s to Lnrd A Upper shale %s is in the expected range.', stress,stress)

                  end
                 end
end
      end
       if Well_Type == [3 2]
            legend(sprintf('Leonard A Shale (%d)',n_Data1),sprintf('Leonard A Carbonate (%d)',n_Data2));
                  sprintf(' ratio of Massive carbonate %s to Lnrd B Upper shale %s is %.2f',stress,stress, mean_val(3)')
if xx==8;
                  if mean_val(3)>(normal_ranges(3,1).*.1+(normal_ranges(3,1))) || mean_val(3)<((normal_ranges(3,1)-normal_ranges(3,1).*.1))
                       sprintf(' ratio of Leonard A carbonate %s to Lnrd A shale %s is outside the expected range. QCing results is reccomended', stress,stress)
                  else 
                 sprintf(' ratio of Leonard A carbonate %s to Lnrd A shale %s is in the expected range.', stress,stress)

                  end
end
                  if xx==11;
                  if mean_val(3)>(normal_ranges(4,1).*.1+(normal_ranges(4,1))) || mean_val(3)<((normal_ranges(4,1)-normal_ranges(4,1).*.1))
                       sprintf(' ratio of Leonard A carbonate %s to Lnrd A shale %s is outside the expected range. QCing results is reccomended', stress,stress)
                  else 
                 sprintf(' ratio of Leonard A carbonate %s to Lnrd A shale %s is in the expected range.', stress,stress)

                  end
                 end
      end
      if Well_Type == [4 2 ]
            legend(sprintf('Leonard B Upper Shale (%d)',n_Data1),sprintf('Leonard B Carbonate (%d)',n_Data2));
                  sprintf(' ratio of Leonard carbonate %s to Leonard B Upper shale %s is %.2f', stress,stress, mean_val(3)')
if xx==8;
                  if mean_val(3)>(normal_ranges(3,1).*.1+(normal_ranges(3,1))) || mean_val(3)<((normal_ranges(3,1)-normal_ranges(3,1).*.1))
                       sprintf(' ratio of Leonard B carbonate %s to Lnrd B Upper shale %s is outside the expected range. QCing results is reccomended', stress,stress)
                  else 
                 sprintf(' ratio of Leonard B carbonate %s to Lnrd B Upper shale %s is in the expected range.', stress,stress)

                  end
end
                 if (xx==11);
                  if mean_val(3)>(normal_ranges(4,1).*.1+(normal_ranges(4,1))) || mean_val(3)<((normal_ranges(4,1)-normal_ranges(4,1).*.1))
                       sprintf(' ratio of Leonard B carbonate %s to Lnrd B upper shale %s is outside the expected range. QCing results is reccomended', stress,stress)
                  else 
                 sprintf(' ratio of Leonard B carbonate %s to Lnrd B upper shale %s is in the expected range.', stress,stress)

                  end
                 end
      end
    
end
