function [Stage_Zone]=Length_Direction(Stage_Information)

Stage_Zone(:,1)=Stage_Information(:,1);

for i=1:length(Stage_Information)
    

    %defines the length of the stage in metres
   Stage_Zone(i,1)=[((Stage_Information(i,4)-(Stage_Information(i,1))).^2 ...;
                    +(Stage_Information(i,5)-(Stage_Information(i,2))).^2 ...;
                    +(Stage_Information(i,6)-(Stage_Information(i,3))).^2)^.5];
    
    if i ~=length(Stage_Information)
   
        
    %Defines the stage seperation
     Stage_Zone(i,2)=[((Stage_Information(i+1,1)-(Stage_Information(i,4))).^2 ...;
                    +(Stage_Information(i+1,2)-(Stage_Information(i,5))).^2 ...;
                    +(Stage_Information(i+1,3)-(Stage_Information(i,6))).^2)^.5];
    else
    Stage_Zone(i,2)=0;
    end
    %Define the Direction of the stage vector
    Stage_Zone(i,3)=Stage_Information(i,4)-(Stage_Information(i,1));
    Stage_Zone(i,4)=Stage_Information(i,5)-(Stage_Information(i,2));
    Stage_Zone(i,5)=Stage_Information(i,6)-(Stage_Information(i,3));

    
end













end