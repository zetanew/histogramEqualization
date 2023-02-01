a = imread(‘cameraman.tif’);
r = size(a,1);
c = size(a,2);

ah=uint8(zeros(r,c));
n = r*c;
f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cum = zeros(256,1);
out = zeros(256,1);
I2=im2double(a);
m=mean2(I2);
contrast1=1./(1+(m./(I2+eps)).⁴);

for i=1:r
for j=1:c
value=a(i,j);
f(value+1)=f(value+1)+1;
pdf(value+1)=f(value+1)/n;
end
end
sum=0; L=255;
for i=1:size(pdf)
sum = sum +f(i);
cum(i) = sum;
cdf(i) = cum(i)/n;
out(i) = round(cdf(i)*L);
end
for i=1:r
for j=1:c
ah(i,j)=out(a(i,j)+1);
end
end
figure, imshow(ah);
figure,imshow(contrast1);
