function [code]=Huffman(b);

b=b(:)/sum(b);   
c=huff5(b);       
code=char(getfirstcode(c,length(b)));
%---------------------------------------------------------------
function y= getfirstcode(a,n)
global y
y=cell(n,1);
getsecondcode(a,[])
%----------------------------------------------------------------
function getsecondcode(m,g)
global y
if isa(m,'cell')
         getsecondcode(m{1},[g 0]);
         getsecondcode(m{2},[g 1]);
else   
   y{m}=char(48+g);   
end

function d=huff5(p);

d=cell(length(p),1);			 
for i=1:length(p)				
   d{i}=i;						
end
while size(d)-2					
	[p,i]=sort(p);					% Sort to ascending probabilities
	d=d(i);							% Reorder tree.
	d{2}={d{1},d{2}};d(1)=[];	% join branch 1 to 2 and prune 1
	p(2)=p(1)+p(2);p(1)=[];		% Merge Probabilities
end
