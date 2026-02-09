#!/bin/bash
#SBATCH -J local_2d_sum
#SBATCH -A ISAAC-UTK0323
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=ai-tenn
#SBATCH --qos=ai-tenn
#SBATCH --time=12:00:00
#SBATCH --array=1-7
#SBATCH --output=/lustre/isaac24/proj/UTK0323/Trung/MMGNN/results/local_2d/local_2d_%A_%a.out
#SBATCH --error=/lustre/isaac24/proj/UTK0323/Trung/MMGNN/results/local_2d/local_2d_%A_%a.err

# Array job: train 2D model with --local sum on 7 datasets
# 1=BACE 2=BBBP 3=clintox 4=ESOL 5=FreeSolv 6=Lipophilicity 7=sider

echo "[$(date)] Starting 2D Local (sum) training - Array Task $SLURM_ARRAY_TASK_ID"
echo "=================================================="

cd /lustre/isaac24/proj/UTK0323/Trung/MMGNN
echo "Working directory: $(pwd)"
mkdir -p /lustre/isaac24/proj/UTK0323/Trung/MMGNN/results/local_2d

source /lustre/isaac24/proj/UTK0323/miniconda3/etc/profile.d/conda.sh || source ~/miniconda3/etc/profile.d/conda.sh || source ~/anaconda3/etc/profile.d/conda.sh
conda activate chemprop

DATASETS=( "BACE" "BBBP" "clintox" "ESOL" "FreeSolv" "Lipophilicity" "sider" )
TYPES=( "classification" "classification" "classification" "regression" "regression" "regression" "classification" )

IDX=$((SLURM_ARRAY_TASK_ID - 1))
NAME="${DATASETS[$IDX]}"
DTYPE="${TYPES[$IDX]}"
CSV="./dataset/${NAME}.csv"

echo "Configuration:"
echo "  - Dataset: $NAME"
echo "  - Mode: 2D, Local (sum)"
echo "  - Dataset type: $DTYPE"
echo "  - Array task ID: $SLURM_ARRAY_TASK_ID"
echo ""

export NUM_WORKERS=1

echo "Running: python train.py --mode 2d --data_path=$CSV --dataset_type=$DTYPE --epochs 100 --batch_size 32 --agg sum"
python train.py --mode 2d --data_path="$CSV" --dataset_type="$DTYPE" --epochs 100 --batch_size 32 --agg sum
