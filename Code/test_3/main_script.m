clear ; close all; clc
%% ==================== Part 1: Load data ====================

fprintf('Loading Data ... \n');

load('Dog_1_interictal_segment_0001.mat');

data=interictal_segment_1.data;
data_length_sec=interictal_segment_1.data_length_sec;
channels=interictal_segment_1.channels;
sampling_frequency=interictal_segment_1.sampling_frequency;
sequence=interictal_segment_1.sequence;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ===========================================================
%% ==================== Part 2:Chopping data =================

fprintf('Chopping data into 1 minute blocks ... \n');

one_min_blocks=create_one_min_blocks(data,data_length_sec,sampling_frequency);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ===========================================================
%% ==================== Part 3:Feature Extraction ============
feature_extraction(data,one_min_blocks);
