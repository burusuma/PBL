#!/bin/bash
# Define output directory
output_dir="./output/commandline"

start=200
end=720

# Loop through each set of images
for ((i=start; i<=end; i++)); do
    prev_i=$((i - 1))
    input_image=$(printf "outputs/frame_%04d.png" $i)
    prompt_images=$(printf "outputs/frame_%04d.png" $prev_i)
    prompt_targets=$(printf "output/commandline/mask_frame_%04d.png" $prev_i)

    echo "input_image: $input_image"
    echo "prompt_image: $prompt_images"
    echo "prompt_target: $prompt_targets"


    # Run the python script with the current set of arguments
    python seggpt_inference.py \
    --input_image $input_image \
    --prompt_image 'images/inputs/dogs.png' $prompt_images \
    --prompt_target 'images/masks/dogs.png' $prompt_targets \
    --output_dir $output_dir
done
