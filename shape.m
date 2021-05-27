%We have seven steps:


%1 - Read the RGB (colored) image in from user.
 image= imread(img);
%2 - Convert image from (RGB) colored to gray image.
grayimg= im2gray(image);
%3 - Threshold the image (convert gray image to binary image)
%4 - Invert the binary image (in order to speed up the time of processing).
imgbin= ~imbinarize(grayimg);
%5 - Find the boundaries concentrate.
B = bwboundaries(imgbin,'no holes');
%6 - Determine shapes properties (ratio of dimensions, roundness).
stats= regionprops(B,'all');
%7 - Classify shapes according to its properties.
% Square = 3 = (1 + 2) = (X=Y + Extent = 1)
% Rectangular = 2 = (0 + 2) = (only Extent = 1)
% Circle = 1 = (1 + 0) = (X=Y , Extent < 1)
% UNKNOWN = 0
  W = uint8(abs(stats.BoundingBox(3)-stats.BoundingBox(4));
  W= W+ 2 * uint8((stats.Extent - 1);
  switch W(i)
      case 1
         printf("The shape is a circle");
      case 2
          printf("The shape is a rectangle");
      case 3
           printf("The shape is a square");
         otherwise
           printf("unknown")
           end