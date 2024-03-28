function [v2,q]=vec_rot_ax(ax,ang,v1)

q=[cos(ang/2);ax*sin(ang/2)];

if nargin>2 && ~isempty(v1)
    v2=vec_rot_quat(q,v1);
else    
    v2=[];
end
