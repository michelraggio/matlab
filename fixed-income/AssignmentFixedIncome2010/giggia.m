%[data, txt, raw]=xlsread('Swap&beyond.xls');
%save Swap&beyond
%clear all

%%
clear all

load Swap&beyond

%%
date=datenum([2006,6,29;
    2007,6,29;
    2008,6,29;
    2009,6,29;
    2010,6,29;
    2011,6,29;
    2012,6,29;
    2013,6,29;
    2014,6,29;
    2015,6,29;
    2016,6,29;
    2017,6,29;
    2018,6,29;
    2019,6,29;
    2020,6,29;
    2021,6,29;
    2022,6,29;
    2023,6,29;
    2024,6,29;
    2025,6,29;
    2026,6,29;
    2027,6,29;
    2028,6,29;
    2029,6,29;
    2030,6,29;
    2031,6,29;
    2032,6,29;
    2033,6,29;
    2034,6,29;
    2035,6,29;]);

day=weekday(date);

corrected_day=date;

for i=1:size(date,1)
    
    if weekday(date(i))==7

    corrected_day(i)=corrected_day(i)+2;
    
    end
    
end


for i=1:size(date,1)
    
    if weekday(date(i))==1

    corrected_day(i)=corrected_day(i)+1;
    
    end
    
end


value_date=datenum([2005,6,29]);
T=(corrected_day-value_date)/365;
tau(1,1)=0;
tau(2:size(date,1),1)=T(2:end)-T(1:end-1);

notional=421.33675;
coupon=0.04019;
b2cofm=notional*coupon;
amortizing=data(5:end-4,7);

quotedcap(1:size(date,1)-1,1)=amortizing(1:end-1)-amortizing(2:end);

quotedcap(size(date,1))=amortizing(end);
libor=data(5:end-4,9);
fwd=data(5:end-4,10);
floor=data(5,11);
cap=data(5,12);
libor_col=libor;
libor_col(libor_col<floor)=floor;
libor_col(libor_col>cap)=cap;
cash2bank_spot=amortizing.*libor_col;
fwd_col=fwd;
fwd_col(fwd_col<floor)=floor;
fwd_col(fwd_col>cap)=cap;
cash2bank_fwd=amortizing.*fwd_col;
df=data(5:end-4,17);
fi=amortizing(1)*coupon;
fileg=fi*df;
fwd_classic=df(1:end-1)./df(2:end)-1;
fl=amortizing(1:end-1).*fwd_classic;
flleg=(fl+quotedcap(1:end-1)).*df(1:end-1);
vol_floor=data(5:34,21);
vol_cap=data(5:34,22);

%%





















