function [ h, gradh, hessh ] = contrainte(flag)

    if (flag==1)
        %% Fonction f1
        
        h=@(x) x(1)+x(3)-1;
        gradh=@(x) [1;0;1]';
        hessh=@(x) [0 0 0; 0 0 0; 0 0 0];
        
    else
        %% Fonction f2
        h=@(x) x(1)^2+x(2)^2-1.5;
        gradh=@(x) [2*x(1) ; 2*x(2)]';
        hessh=@(x) [2 0; 0 2];

    end

end

