originalcolor = imread('kidney_zeiss.tif');
recoveredcolor = imread('kidney_gray.tif');

prun = 0;
imagex = size(originalcolor,2);
imagey = size(originalcolor,1);

dE00 = zeros(imagey-2*prun,imagex-2*prun);

p = 1;
for i = 1+prun : imagey-prun
    q = 1;
    for j = 1+prun : imagex-prun
        srgb1 = double(squeeze(originalcolor(i,j,:)));
        srgb2 = double(squeeze(recoveredcolor(i,j,:)));
        dE00(p,q) = deltae00 (srgb1',srgb2');
        q = q + 1;
    end
    p = p + 1;
end

save('kidney_de2000','dE00')
