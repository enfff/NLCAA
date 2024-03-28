function q=dcm2qua(T)

q=zeros(4,1);
tr=trace(T);

epsi=1e-6;
q(1,:)=sqrt(1+tr)/2;
if abs(q(1))>epsi
    q(2:4,:)=[T(3,2)-T(2,3);T(1,3)-T(3,1);T(2,1)-T(1,2)]/4/q(1);
else
    q(2,:)=sqrt(1-tr+2*T(1,1))/2;
    if abs(q(2))>epsi
        q(3:4,:)=[T(1,2)+T(2,1);T(1,3)+T(3,1)]/4/q(2);
    else
        q(3,:)=sqrt(1-tr+2*T(2,2))/2;
        if abs(q(1))>epsi
            q(4,:)=(T(1,2)-T(2,1))/4/q(3);
        else
            q(4,:)=1;
        end
    end
end

q=q/norm(q);

% alternative (with possible numerical problems)
% q(2,:)=sign(T(3,2)-T(2,3))*sqrt(1-tr+2*T(1,1))/2;
% q(3,:)=sign(T(1,3)-T(3,1))*sqrt(1-tr+2*T(2,2))/2;
% q(4,:)=sign(T(2,1)-T(1,2))*sqrt(1-tr+2*T(3,3))/2;