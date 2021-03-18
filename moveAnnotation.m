function moveAnnotation(h,pos,N)
% moveAnnotation(h,pos,N)
% Moves annotation with handle h to the new position given as
% old_position+pos, where pos = [pos_left pos_bottom]. Animation happens in
% N frames.
%
% h may be a vector containing handles of several annotations.

old_position = zeros(length(h),4);
for j=1:length(h)
    old_position(j,:) = h(j).Position;
end

pos_left = nonLinspace(0,pos(1),N,'cos');
pos_bot = nonLinspace(0,pos(2),N,'cos');
for i = 2:N
    for j=1:length(h)
        h(j).Position = old_position(j,:)+[pos_left(i) pos_bot(i) 0 0];
    end
    animateNow;
end
end
