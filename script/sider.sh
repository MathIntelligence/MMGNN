## 2D
python train.py --mode 2d --data_path=./data/sider.csv --dataset_type=classification --epochs 100 --agg sum

python train.py --mode 2d --data_path=./data/sider.csv --dataset_type=classification --epochs 100 --agg mean

python train.py --mode 2d --data_path=./data/sider.csv --dataset_type=classification --agg attn

## 3D
python train.py --mode 3d --data_path=./data/sider.csv --dataset_type=classification --epochs 100 --batch_size 32 --agg sum

python train.py --mode 3d --data_path=./data/sider.csv --dataset_type=classification --epochs 100 --batch_size 32 --agg mean

python train.py --mode 3d --data_path=./data/sider.csv --dataset_type=classification --epochs 100 --batch_size 32 --agg attn