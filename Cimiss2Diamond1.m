clear;
clc;

tic
files = dir('*.txt');
path = 'C:\Users\Levan\Desktop\新建文件夹\';
for i = 1 : 3
    data = dlmread(files(i).name,' ',2,7);
    data(data(:,1) < 10000,:) = [];
    data(data(:,1) > 900000,:) = [];
    for h = 0 : 23
        r = 1;
        data_t = [];
        data_output = [];
        for j = 1 : length(data)
            if data(j,13) == h
                data_t(r,:) = data(j,:);
                r = r + 1;            
            end
        end    
        data_output(:,1) = data_t(:,1); %区站号
        data_output(:,2) = data_t(:,3); %经度
        data_output(:,3) = data_t(:,2); %纬度
        data_output(:,4) = data_t(:,4); %海拔高度
        data_output(:,5) = data_t(:,8); %站点级别
        data_output(:,6) = 9999; %总云量
        data_output(:,7) = data_t(:,47);%风向
        data_output(:,8) = data_t(:,48); %风速
        data_output(:,9:10) = data_t(:,15:16); %海平面气压 3小时变压
        data_output(:,11:12) = 9999; %过去天气1 过去天气2
        data_output(:,13) = data_t(:,37); %6小时降水
        data_output(:,14:16) = 9999; %低云量、低云高
        data_output(:,17) = data_t(:,30); %露点
        data_output(:,18:19) = 9999;%能见度、现在天气
        data_output(:,20) = data_t(:,22); %温度
        data_output(:,21:22) = 9999; %中云状、高云状
        data_output(:,23) = 1; %标志1
        data_output(:,24) = 2; %标志2
        data_output(:,25:26) = 9999;%24小时变温 24小时变压
        display('dddd')
        if h < 10
            hh = ['0',num2str(h)];
        else
            hh = num2str(h);
        end
        fid = fopen([path,files(i).name(1:8),hh,'.000'],'wt');
        fprintf(fid,'%s\n',['diamond 1 2019年6月',...
            files(i).name(7:8),'日',hh,'时地面填图']);
        fprintf(fid,'%s\n',['19 06',' ',files(i).name(7:8),' ',...
            hh,' ',num2str(length(data_output))]);
        for p = 1 : length(data_output)
            fprintf(fid,'%d %f %f %f %d %d %d %f %f %f %d %d %d %d %d %d %f %d %d %f %d %d %d %d %d %d\n',...
                data_output(p,1),data_output(p,2),data_output(p,3),data_output(p,4),data_output(p,5),...
                data_output(p,6),data_output(p,7),data_output(p,8),data_output(p,9),data_output(p,10),...
                data_output(p,11),data_output(p,12),data_output(p,13),data_output(p,14),data_output(p,15),...
            data_output(p,16),data_output(p,17),data_output(p,18),data_output(p,19),data_output(p,20),data_output(p,21),...
            data_output(p,22),data_output(p,23),data_output(p,24),data_output(p,25),data_output(p,26));
        end
        fclose(fid);        
    end
end




toc