function DarkCarBig(Template, g)

C2 = normxcorr2(Template, g);
figure,imagesc(C2),colormap gray
title('Big dark window: NCC for image 0376');

% Maximum score in the score map
    [ypeak, xpeak] = find(C2 == max(C2(:)));
    yoff = ypeak - size(Template,1);
    xoff = xpeak - size(Template,2);
    figure;
    imshow(g); hold on;
    
    rectangle('Position', [xoff+1, yoff+1, size(Template,2), size(Template,1)], ...
              'EdgeColor','r', 'LineWidth',2);
    plot(xoff+1 + size(Template,2)/2, yoff+1 + size(Template,1)/2, ...
         'r+', 'MarkerSize',10, 'LineWidth',2);
    title('Big dark window: Image 1 - NCC max & box');

    hold off;