%�ɲȷ������������Ϊż��8�Ķ�Ƶ������
% clear;
% c=3e8;%����
% B=[6.25e9 6.75e9 7.25e9 7.75e9 8.25e9 8.75e9 9.25e9 9.75e9 10.25e9];
% lemda=c./B;
%%*************************************************************************
% V=323;
% K=161;
% L=80;
% M=35;
% N=38;
% D= [0 1 3 4 9 10 12 14 16 19 22 25 26 27 29 30 31 35 36 37 38 40 41 42,...
% 43 46 47 48 49 55 56 57 64 65 66 71 75 76 77 78 79 81 83 87 88 90 91 93,...
% 95 97 100 101 104 105 106 107 108 109 111 113 114 115 116 118 120 121,...
% 122 123 124 126 129 133 134 137 138 140 141 143 144 146 147 148 149 152,...
% 157 160 161 164 165 167 168 169 171 172 173 178 181 184 188 190 191 192,...
% 193 195 196 198 206 209 211 213 220 224 225 227 228 229 231 234 237 239,...
% 241 243 247 249 250 251 253 254 256 260 261 262 263 264 265 266 269 270,...
% 271 273 278 279 284 285 290 291 295 299 300 302 303 304 305 308 310 312,...
% 315 316 317 318 321];
%%-------------------------------------------------------------------------
% V=255;
% K=127;
% L=63;
% M=30;
% N=34;
% D=[0 7 11 13 14 17 19 22 23 26 27 28 34 38 39 43 44 46 47 49 51 52 53,...
% 54 55 56 57 63 67 68 76 77 78 83 85 86 88 89 92 94 95 97 98 99 101,... 
% 102 104 106 108 110 111 112 113 114 115 119 121 123 125 126 131 133 134,...
% 136 137 139 141 147 149 151 152 153 154 155 156 159 161 166 169 170 172,... 
% 175 176 177 178 183 184 185 187 188 189 190 193 194 196 197 198 201 202,...
% 203 204 205 207 208 212 215 216 219 220 221 222 224 226 228 229 230 231,...
% 235 237 238 242 243 245 246 249 250 252];
% 
% D=sort(mod(D+0,V));
% Dempty=zeros(1,V);
% Dfull=0:V-1;
% Dc=zeros(1,V-K);
% for m=1:length(D)
%     Dfull(D(m)+1)=0;
% end
% n=0;
% for m=2:V
%     if Dfull(m)~=0,n=n+1;Dc(n)=Dfull(m);end
% end
% Dc=sort(Dc);
% D8=[D,D+V,D+2*V,D+3*V];Dc8=[Dc,Dc+V,Dc+2*V,Dc+3*V];
% M=35;
% N=38;
% Nf=8;
% P=zeros(M,N);index1=zeros(1,K*Nf/2);index2=zeros(1,(V-K)*Nf/2);
% for m=1:K*Nf/2
%     index1(m)=2*mod(m-1,Nf/2)+1;
%     P(mod(D8(m),M)+1,mod(D8(m),N)+1)=index1(m);
% end
% for m=1:(V-K)*Nf/2
%     index2(m)=2*mod(m-1,Nf/2)+2;
%     P(mod(Dc8(m),M)+1,mod(Dc8(m),N)+1)=index2(m);
% end
%%************************************************************************* 
% dx=lemda(Nf)/2*(0:N-1);
% dy=lemda(Nf)/2*(0:M-1);
% res=201;
% k=2*pi./lemda;
% theta=linspace(-pi/2,pi/2,res);
% phi=linspace(0,2*pi,res);%[0,pi/2];
% theta0=0;
% phi0=pi/2;
% u=sin(theta')*cos(phi)-sin(theta0)*cos(phi0);
% v=sin(theta')*sin(phi)-sin(theta0)*sin(phi0);
% u=u';v=v';
% S1=zeros(size(u));S2=zeros(size(u));
% S3=zeros(size(u));S4=zeros(size(u));
% S5=zeros(size(u));S6=zeros(size(u));
% S7=zeros(size(u));S8=zeros(size(u));
% for m=1:M
%     for n=1:N
%         if (P(m,n)==1),S1=S1+exp(i*k(1)*(dx(n)*u+dy(m)*v));end
%         if (P(m,n)==2),S2=S2+exp(i*k(2)*(dx(n)*u+dy(m)*v));end
%         if (P(m,n)==3),S3=S3+exp(i*k(3)*(dx(n)*u+dy(m)*v));end
%         if (P(m,n)==4),S4=S4+exp(i*k(4)*(dx(n)*u+dy(m)*v));end
%         if (P(m,n)==5),S5=S5+exp(i*k(5)*(dx(n)*u+dy(m)*v));end
%         if (P(m,n)==6),S6=S6+exp(i*k(6)*(dx(n)*u+dy(m)*v));end
%         if (P(m,n)==7),S7=S7+exp(i*k(7)*(dx(n)*u+dy(m)*v));end
%         if (P(m,n)==8),S8=S8+exp(i*k(8)*(dx(n)*u+dy(m)*v));end
%     end
% end
% S1=abs(S1);S2=abs(S2);S3=abs(S3);S4=abs(S4);
% S5=abs(S5);S6=abs(S6);S7=abs(S7);S8=abs(S8);
% S1=20*log10(S1/max(max(S1)));S2=20*log10(S2/max(max(S2)));
% S3=20*log10(S3/max(max(S3)));S4=20*log10(S4/max(max(S4)));
% S5=20*log10(S5/max(max(S5)));S6=20*log10(S6/max(max(S6)));
% S7=20*log10(S7/max(max(S7)));S8=20*log10(S8/max(max(S8)));
%%*************************************************************************
% S=S1;
% for m=1:res
%     for n=1:res
%         if S(m,n)<-40,S(m,n)=-40;end
%     end
% end
% figure(1);
% surf(u,v,S);
%%*************************************************************************
% hold off;
% for m=1:length(D8)
%     for n=1:length(D8)
%         T(m,n)=mod(D8(m)-D8(n),4*V);
%     end
% end
% for m=1:4*V-1
%     num(m)=length(find(T==m));
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
c=3e8;%����
B=[6.25e9 6.75e9 7.25e9 7.75e9 8.25e9 8.75e9 9.25e9 9.75e9 10.25e9];
lemda=c./B;
%**************************************************************************
V=1023;
K=511;
L=255;
M=31;N=33;%���еĴ�СΪM*N=V,s=731
D=[0 1 2 3 4 6 8 9 12 15 16 18 21 24 25 30 31 32 33 36 41 42 43 45,...
47 48 50 51 59 60 62 64 66 69 72 77 79 81 82 84 85 86 90 91 94 95 96 99,...
100 102 103 107 118 119 120 121 123 124 127 128 129 131 132 133 138 143,...
144 147 153 154 157 158 162 164 165 168 170 171 172 175 179 180 181 182,...
183 187 188 189 190 191 192 195 198 200 201 203 204 205 206 209 211 214,...
221 227 231 233 235 236 237 238 239 240 241 242 245 246 248 254 256 258,...
261 262 264 266 267 273 275 276 277 286 288 289 294 295 297 301 303 306,...
307 308 311 314 315 316 317 321 324 325 328 330 331 335 336 337 340 342,...
343 344 345 347 349 350 351 353 355 357 358 359 360 362 363 364 365 366,...
367 373 374 376 377 378 380 381 382 383 384 389 390 391 395 396 397 399,...
400 402 405 406 407 408 409 410 412 413 417 418 422 423 425 427 428 429,...
433 437 441 442 445 447 454 455 459 462 466 467 469 470 472 473 474 476,...
478 479 480 481 482 484 485 487 489 490 491 492 495 496 497 501 503 505,...
507 508 509 512 513 516 519 522 524 527 528 532 533 534 535 537 541 546,...
550 551 552 554 557 559 561 563 565 571 572 573 575 576 577 578 583 585,...
588 590 594 597 599 601 602 603 605 606 607 609 612 613 614 616 617 622,...
625 627 628 629 630 631 632 634 642 645 648 649 650 656 659 660 662 663,...
665 667 669 670 672 674 677 679 680 683 684 685 686 687 688 689 690 691,...
693 694 695 698 700 702 703 706 707 709 710 711 714 715 716 718 720 723,...
724 725 726 728 730 732 734 735 739 741 745 746 748 751 752 754 755 756,...
757 759 760 762 763 764 765 766 768 771 775 778 779 780 782 787 790 791,...
792 793 794 797 798 799 800 803 804 810 811 812 813 814 815 816 818 820,...
824 825 826 827 834 836 841 843 844 845 846 850 851 853 854 855 856 857,...
858 859 863 865 866 867 869 873 874 879 881 882 884 887 889 890 891 893,...
894 897 899 901 905 907 908 910 911 913 917 918 919 924 925 932 933 934,...
937 938 939 940 941 943 944 945 946 948 951 952 955 956 957 958 960 961,...
962 964 965 967 968 970 971 974 978 980 981 982 983 984 987 989 990 992,...
994 995 997 1002 1003 1005 1006 1009 1010 1013 1014 1016 1018];

D=sort(mod(D+0,V));
Dempty=zeros(1,V);
Dfull=0:V-1;
Dc=zeros(1,V-K);
for m=1:length(D)
    Dfull(D(m)+1)=0;
end
n=0;
for m=2:V
    if Dfull(m)~=0,n=n+1;Dc(n)=Dfull(m);end
end
Dc=sort(Dc);

Nf=8;
P=zeros(M,N);index1=zeros(1,K*Nf/2);index2=zeros(1,(V-K)*Nf/2);
for m=1:K
    index1(m)=2*mod(m-1,Nf/2)+1;
    P(mod(D(m),M)+1,mod(D(m),N)+1)=index1(m);
end
for m=1:(V-K)
    index2(m)=2*mod(m-1,Nf/2)+2;
    P(mod(Dc(m),M)+1,mod(Dc(m),N)+1)=index2(m);
end
%**************************************************************************
dx=lemda(Nf)/2*(0:N-1);
dy=lemda(Nf)/2*(0:M-1);
res=401;
k=2*pi./lemda;
theta=linspace(-pi/2,pi/2,res);
phi=linspace(0,2*pi,res);%[0,pi/2];
theta0=0;%pi/4;
phi0=pi/2;
u=sin(theta')*cos(phi)-sin(theta0)*cos(phi0);
v=sin(theta')*sin(phi)-sin(theta0)*sin(phi0);
u=u';v=v';
S1=zeros(size(u));S2=zeros(size(u));
S3=zeros(size(u));S4=zeros(size(u));
S5=zeros(size(u));S6=zeros(size(u));
S7=zeros(size(u));S8=zeros(size(u));
for m=1:M
    for n=1:N
        if (P(m,n)==1),S1=S1+exp(i*k(1)*(dx(n)*u+dy(m)*v));end
        if (P(m,n)==2),S2=S2+exp(i*k(2)*(dx(n)*u+dy(m)*v));end
        if (P(m,n)==3),S3=S3+exp(i*k(3)*(dx(n)*u+dy(m)*v));end
        if (P(m,n)==4),S4=S4+exp(i*k(4)*(dx(n)*u+dy(m)*v));end
        if (P(m,n)==5),S5=S5+exp(i*k(5)*(dx(n)*u+dy(m)*v));end
        if (P(m,n)==6),S6=S6+exp(i*k(6)*(dx(n)*u+dy(m)*v));end
        if (P(m,n)==7),S7=S7+exp(i*k(7)*(dx(n)*u+dy(m)*v));end
        if (P(m,n)==8),S8=S8+exp(i*k(8)*(dx(n)*u+dy(m)*v));end
    end
end
S1=abs(S1);S2=abs(S2);S3=abs(S3);S4=abs(S4);
S5=abs(S5);S6=abs(S6);S7=abs(S7);S8=abs(S8);
S1=20*log10(S1/max(max(S1)));S2=20*log10(S2/max(max(S2)));
S3=20*log10(S3/max(max(S3)));S4=20*log10(S4/max(max(S4)));
S5=20*log10(S5/max(max(S5)));S6=20*log10(S6/max(max(S6)));
S7=20*log10(S7/max(max(S7)));S8=20*log10(S8/max(max(S8)));
%**************************************************************************
S=S8;
for m=1:res
    for n=1:res
        if S(m,n)<-40,S(m,n)=-40;end
    end
end
figure(1);
surf(u,v,S);
% figure(2);
% plot(theta*180/pi,S(51,:));
% hold on
% plot(theta*180/pi,-3*ones(1,res));
% grid on;
% hold off
% figure(3);
% plot(phi*180/pi,S(:,151),'k');
% hold on;
% plot(phi*180/pi,-3*ones(res,1));
% grid on;
% hold off
%search PSLL
Mrsl=-100*ones(1,(res-1)/2);
for m=1:(res-1)/2
    for n=1:(res-1)/2
        if S(m,n)>S(m,n+1),brk=n;end
    end
    Mrsl(m)=max(S(m,1:brk));
end
mrsl=max(Mrsl);