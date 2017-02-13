%data = read_src(f_in)
%
%A function to read a V2src file into a structure.
%
%IN:    f_in: the path and name of an src file to read
%
%OUT:   data: a structure containing the information from the src file.
%
%Ken Kocon 2013

function data = read_src(f_in)

%read the src
fp = fopen(f_in,'r');
hdr = textscan(fp,'%s',1,'delimiter','\n');
C = textscan(fp, ...    
    '%s%s%s%d%s%f%f%f%f%d%f%f%f%f%f%f%d%d%s%f%d%s%f%f%f%f%f%f%f%f%f%f%f%f%f%d');
fclose(fp);

if length(C)~=36
   error('read_src.m: src file is not a V2src');
end

ndat = length(C{7});

%create the date time and ms strings
datetime = [char(C{1}),blanks(ndat)',char(C{2})];
[~,ncol] = size(datetime);
msec = datetime(:,ncol-2:ncol);

%compute the date number
%include ms
date_num = zeros(ndat,1);
for i = 1:ndat
    date_num(i,1) = datenum(datetime(i,:),'mm-dd-yyyy HH:MM:SS.FFF');
  
end

datetime = datetime(:,1:ncol-4);

%re-rorder datetime from mm-dd-yyyy to yyyy-mm-dd to match SQL
datetime2 = datetime;datetime = char(datetime);
datetime(:,1:4) = datetime2(:,7:10); %yyyy
datetime(:,5) = datetime2(:,3);
datetime(:,6:7) = datetime2(:,1:2); %mm
datetime(:,8) = datetime2(:,3);
datetime(:,9:10) = datetime2(:,4:5); %dd
datetime = cellstr(datetime);

%construct the data structure
data = struct('datetime',datetime,'datesec',num2cell(msec,2), ...
    'datenum',num2cell(date_num,2),'N',num2cell(C{7},2),'E',num2cell(C{8},2), ...
    'Z',num2cell(C{9},2),'Ne',num2cell(C{11},2),'Ee',num2cell(C{12},2), ...
    'Ze',num2cell(C{13},2),'ID',C{3},'type',C{5},'MomMag',num2cell(C{24},2), ...
    'SeiMoment',num2cell(C{25},2),'SourceRo',num2cell(C{28},2), ...
    'AppStress',num2cell(C{31},2),'Energy',num2cell(C{26},2),'EsEp',num2cell(C{27},2),...
    'StaticStress',num2cell(C{30},2),'Displacement',num2cell(C{33},2));