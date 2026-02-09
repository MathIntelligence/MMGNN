## 2D
python train.py --mode 2d --data_path=./data/Lipophilicity.csv --dataset_type=classification --agg sum

python train.py --mode 2d --data_path=./data/Lipophilicity.csv --dataset_type=classification --batch_size 32 --agg mean

python train.py --mode 2d --data_path=./data/Lipophilicity.csv --dataset_type=classification --batch_size 32 --agg attn

## 3D
python train.py --mode 3d --data_path=./data/Lipophilicity.csv --dataset_type=classification --agg sum

python train.py --mode 3d --data_path=./data/Lipophilicity.csv --dataset_type=classification --agg mean

python train.py --mode 3d --data_path=./data/Lipophilicity.csv --dataset_type=classification --agg attn