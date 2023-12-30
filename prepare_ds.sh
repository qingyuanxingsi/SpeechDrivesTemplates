DATA_ROOT=datasets/speakers
SPEAKER=luo

echo "> STEP 1.1:Change FPS"
python data_preprocess/1_1_change_fps.py $DATA_ROOT/$SPEAKER/raw $DATA_ROOT/$SPEAKER/videos
echo "> STEP 1.2:Video to Frames"
python data_preprocess/1_2_video2frames.py -b $DATA_ROOT -s $SPEAKER -fps 15
echo "> STEP 2.1:Generate Kpts"
python data_preprocess/2_1_gen_kpts.py $DATA_ROOT/$SPEAKER
echo "> STEP 2.2:Remove Outlier"
python data_preprocess/2_2_remove_outlier.py -b $DATA_ROOT -s $SPEAKER
echo "> STEP 2.3:Rescale Shoulder Width"
python data_preprocess/2_3_rescale_shoulder_width.py $DATA_ROOT/$SPEAKER
echo "> STEP 3.1:Generate Clips"
python data_preprocess/3_1_generate_clips.py -b $DATA_ROOT -s $SPEAKER
echo "> STEP 3.2:Split Train Val Test"
python data_preprocess/3_2_split_train_val_test.py -b $DATA_ROOT -s $SPEAKER
echo "> STEP 4.1:Calculate Mean and Std"
python data_preprocess/4_1_calculate_mean_std.py -b $DATA_ROOT -s $SPEAKER
# python data_preprocess/4_2_parse_mean_std_npz.py -b $DATA_ROOT -s $SPEAKER