function DarkCarSmall(Template, g)

C1 = normxcorr2(Template, g);
figure,imagesc(C1),colormap gray
title('Small window: NCC for image 0376');

% Maximum score in the score map
    [ypeak, xpeak] = find(C1 == max(C1(:)));
    yoff = ypeak - size(Template,1);
    xoff = xpeak - size(Template,2);
    figure;
    imshow(g); hold on;
    % Creating a rectangle with the same dimensions of the template
    rectangle('Position', [xoff+1, yoff+1, size(Template,2), size(Template,1)], ...
              'EdgeColor','r', 'LineWidth',2);
    % Maximum score positions put at the centre of the rectangle
    plot(xoff+1 + size(Template,2)/2, yoff+1 + size(Template,1)/2, ...
         'r+', 'MarkerSize',10, 'LineWidth',2);

    title('Small dark window: Image 1 - NCC max & box');

    hold off;