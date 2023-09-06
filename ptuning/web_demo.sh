PRE_SEQ_LEN=128

CUDA_VISIBLE_DEVICES=0 python3 web_demo.py \
    --model_name_or_path /mnt/model \
    --ptuning_checkpoint /mnt/checkpoint-1 \
    --pre_seq_len $PRE_SEQ_LEN

