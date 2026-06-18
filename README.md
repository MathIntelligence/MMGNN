# MMGNN: Multi-level, multi-color graph neural networks for molecular property prediction

A graph neural network framework for molecular property prediction supporting both 2D molecular graphs and 3D geometric features.

## Requirements

- Python 3.9
- PyTorch
- RDKit
- scikit-learn
- NumPy, pandas, tqdm, numba
- tensorboardX

## Installation

Create and activate the conda environment:
```bash
conda env create -f environment.yml
conda activate mmgnn
```

## Dataset

Download the datasets: [dataset](https://tinyurl.com/mmgnndata)

After downloading, place the `dataset/` folder in the project root

## Training

**Basic command:**
```bash
python train.py --mode <2d|3d> --data_path <path-to-csv> --dataset_type <classification|regression> --agg <sum|mean|attn>
```

**Key arguments:**
- `--mode`: Choose `2d` or `3d` mode
- `--data_path`: Path to dataset CSV file
- `--dataset_type`: Task type (`classification`, `regression`)
- `--agg`: Aggregation method (`sum`, `mean`, `attn`)

For complete argument list, see `mmgnn/parsing.py` or run `python train.py --help`.

Example usage: 

```bash
python train.py \
  --mode 2d \
  --data_path ./dataset/BBBP.csv \
  --dataset_type classification \
  --agg attn 
```

Detailed training scripts for each dataset will be available in the `scripts/` folder.

### Prediction

Use trained models for inference:
```bash
python predict.py \
  --data_path ./dataset/clintox.csv \
  --checkpoint_dir results/model/clintox/2d/local_sum/
```

## Citation

If you use this code in your research, please cite our paper:

```
[Citation will be added upon publication]
```


