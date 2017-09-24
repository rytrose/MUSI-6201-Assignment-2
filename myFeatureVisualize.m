% Script: myFeatureVisualize
% Write all your code for this part of the assignment here.
% You are free to write more functions of your own but make 
% sure that everything is performed within this script.

%*******************MAKE SURE TO CHANGE FILE PATHS BELOW*******************
music = getMetaData('../music_speech/music_wav', 1024, 256);
speech = getMetaData('../music_speech/speech_wav', 1024, 256);
%**************************************************************************

music_size = size(music);
speech_size = size(speech);
num_music = music_size(2);
num_speech = speech_size(2);

both = horzcat(music, speech);
num_features = length(both);
normalized_both = zScoreNormalize(both);
normalized_music = normalized_both(:,[1:num_music]);
normalized_speech = normalized_both(:,[(num_music + 1):(num_music + num_speech)]);

%%

% feature vector map
% 1 - SC mean
% 2 - SC std
% 3 - RMS mean
% 4 - RMS std
% 5 - ZCR mean
% 6 - ZCR std
% 7 - SCR mean
% 8 - SCR std
% 9 - SF mean
% 10 - SF std

%music
SC_mean_music = normalized_music(1,:);
SC_std_music = normalized_music(2,:);
RMS_mean_music = normalized_music(3,:);
RMS_std_music = normalized_music(4,:);
ZCR_mean_music = normalized_music(5,:);
ZCR_std_music = normalized_music(6,:);
SCR_mean_music = normalized_music(7,:);
SCR_std_music = normalized_music(8,:);
SF_mean_music = normalized_music(9,:);
SF_std_music = normalized_music(10,:);

%speech
SC_mean_speech = normalized_speech(1,:);
SC_std_speech = normalized_speech(2,:);
RMS_mean_speech = normalized_speech(3,:);
RMS_std_speech = normalized_speech(4,:);
ZCR_mean_speech = normalized_speech(5,:);
ZCR_std_speech = normalized_speech(6,:);
SCR_mean_speech = normalized_speech(7,:);
SCR_std_speech = normalized_speech(8,:);
SF_mean_speech = normalized_speech(9,:);
SF_std_speech = normalized_speech(10,:);

figure(1);
%SC mean, SCR mean
scatter(SC_mean_music,SCR_mean_music,80,'r','*')
hold all
scatter(SC_mean_speech,SCR_mean_speech,80,'b','+')
xlabel('SC mean') % x-axis label
ylabel('SCR mean') % y-axis label
legend('music','speech')
title('Mean SC vs Mean SCR with Music & Speech')

figure(2);
%SF mean, ZCR mean
scatter(SF_mean_music,ZCR_mean_music,80,'r','*')
hold all
scatter(SF_mean_speech,ZCR_mean_speech,80,'b','+')
xlabel('SF mean') % x-axis label
ylabel('ZCR mean') % y-axis label
legend('music','speech')
title('Mean SF vs Mean ZCR with Music & Speech')

figure(3);
%RMS mean, RMS std
scatter(RMS_mean_music,RMS_std_music,80,'r','*')
hold all
scatter(RMS_mean_speech,RMS_std_speech,80,'b','+')
xlabel('RMS mean') % x-axis label
ylabel('RMS std') % y-axis label
legend('music','speech')
title('Mean RMS vs std RMS with Music & Speech')

figure(4);
%ZCR std, SCR std
scatter(ZCR_std_music,SCR_std_music,80,'r','*')
hold all
scatter(ZCR_std_speech,SCR_std_speech,80,'b','+')
xlabel('ZCR std') % x-axis label
ylabel('SCR std') % y-axis label
legend('music','speech')
title('std ZCR vs std SCR with Music & Speech')

figure(5);
%SC std, SF std
scatter(SC_std_music,SF_std_music,80,'r','*')
hold all
scatter(SC_std_speech,SF_std_speech,80,'b','+')
xlabel('SC std') % x-axis label
ylabel('SF std') % y-axis label
legend('music','speech')
title('std SC vs std SF with Music & Speech')