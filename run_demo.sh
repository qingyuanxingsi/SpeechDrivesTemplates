export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
python main.py --config_file configs/voice2pose_sdt_bp.yaml \
    --tag luo \
    --demo_input demo2_optim.wav \
    --checkpoint checkpoints/voice2pose_sdt_bp-luo-ep100.pth \
    DATASET.SPEAKER luo