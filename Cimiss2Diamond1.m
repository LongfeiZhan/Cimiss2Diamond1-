clear;
clc;

tic
files = dir('*.txt');
path = 'C:\Users\Levan\Desktop\�½��ļ���\';
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
        data_output(:,1) = data_t(:,1); %��վ��
        data_output(:,2) = data_t(:,3); %����
        data_output(:,3) = data_t(:,2); %γ��
        data_output(:,4) = data_t(:,4); %���θ߶�
        data_output(:,5) = data_t(:,8); %վ�㼶��
        data_output(:,6) = 9999; %������
        data_output(:,7) = data_t(:,47);%����
        data_output(:,8) = data_t(:,48); %����
        data_output(:,9:10) = data_t(:,15:16); %��ƽ����ѹ 3Сʱ��ѹ
        data_output(:,11:12) = 9999; %��ȥ����1 ��ȥ����2
        data_output(:,13) = data_t(:,37); %6Сʱ��ˮ
        data_output(:,14:16) = 9999; %�����������Ƹ�
        data_output(:,17) = data_t(:,30); %¶��
        data_output(:,18:19) = 9999;%�ܼ��ȡ���������
        data_output(:,20) = data_t(:,22); %�¶�
        data_output(:,21:22) = 9999; %����״������״
        data_output(:,23) = 1; %��־1
        data_output(:,24) = 2; %��־2
        data_output(:,25:26) = 9999;%24Сʱ���� 24Сʱ��ѹ
        display('dddd')
        if h < 10
            hh = ['0',num2str(h)];
        else
            hh = num2str(h);
        end
        fid = fopen([path,files(i).name(1:8),hh,'.000'],'wt');
        fprintf(fid,'%s\n',['diamond 1 2019��6��',...
            files(i).name(7:8),'��',hh,'ʱ������ͼ']);
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