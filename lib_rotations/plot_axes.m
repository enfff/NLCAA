function plot_axes(OR,a,cc,sw,ta)

if nargin>4
    aob=findobj('tag',ta);
    if ~isempty(aob)
        delete(aob)
    end
else
    ta='';
end

%OR=zeros(3,1);

% for j=1:3
%     a(:,j)=a(:,j)/norm(a(:,j));
% end

ax=mArrow3(OR,a(:,1),'color',cc,'stemWidth',sw);
ay=mArrow3(OR,a(:,2),'color',cc,'stemWidth',sw);
az=mArrow3(OR,a(:,3),'color',cc,'stemWidth',sw);
set([ax ay az],'tag',ta);
