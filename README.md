<div align="center">
<h1>SegGPT: Segmenting Everything In Context </h1>

[Xinlong Wang](https://www.xloong.wang/)<sup>1*</sup>, &nbsp; [Xiaosong Zhang](https://scholar.google.com/citations?user=98exn6wAAAAJ&hl=en)<sup>1*</sup>, &nbsp; [Yue Cao](http://yue-cao.me/)<sup>1*</sup>, &nbsp; [Wen Wang](https://scholar.google.com/citations?user=1ks0R04AAAAJ&hl)<sup>2</sup>, &nbsp;  [Chunhua Shen](https://cshen.github.io/)<sup>2</sup>, &nbsp; [Tiejun Huang](https://scholar.google.com/citations?user=knvEK4AAAAAJ&hl=en)<sup>1,3</sup>

<sup>1</sup>[BAAI](https://www.baai.ac.cn/english.html), &nbsp; <sup>2</sup>[ZJU](https://www.zju.edu.cn/english/), &nbsp; <sup>3</sup>[PKU](https://english.pku.edu.cn/)
<br>
  
<image src="seggpt_teaser.png" width="720px" />
<br>

</div>

<br>

   We present SegGPT, a generalist model for segmenting everything in context. With only one single model, SegGPT can perform arbitrary segmentation tasks in images or videos via in-context inference, such as object instance, stuff, part, contour, and text. 
   SegGPT is evaluated on a broad range of tasks, including few-shot semantic segmentation, video object segmentation, semantic segmentation, and panoptic segmentation. 
   Our results show strong capabilities in segmenting in-domain and out-of-domain targets, either qualitatively or quantitatively. 

[[Paper]](https://arxiv.org/abs/2304.03284)

## **SegGPT Usage**
- We release the [SegGPT model](https://huggingface.co/BAAI/SegGPT/blob/main/seggpt_vit_large.pth) and inference code for segmentation everything, as well as some example images and videos.

### Run the demo
See this notebook. <br>

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1UmU6PzQbbFWr-BkfCIb7h0z9Kjc1e_Ul#scrollTo=Qel8tPKOS_I-)

### Rocal Installation
```
git clone https://github.com/baaivision/Painter
cd Painter/SegGPT/SegGPT_inference && wget https://huggingface.co/BAAI/SegGPT/resolve/main/seggpt_vit_large.pth
pip install -r requirements.txt
```



### Quick use
Everything in an image with a prompt.
```
python seggpt_inference.py \
--input_image examples/hmbb_2.jpg \
--prompt_image examples/hmbb_1.jpg \
--prompt_target examples/hmbb_1_target.png \
--output_dir ./
```

Everything in an image with multiple prompts.
```
python seggpt_inference.py \
--input_image examples/hmbb_3.jpg \
--prompt_image examples/hmbb_1.jpg examples/hmbb_2.jpg \
--prompt_target examples/hmbb_1_target.png examples/hmbb_2_target.png \
--output_dir ./
```

Everything in a video using a prompt image.
```
python seggpt_inference.py \
--input_video examples/video_1.mp4 \
--prompt_image examples/video_1.jpg \
--prompt_target examples/video_1_target.png \
--output_dir ./
```

Everything in a video using the first frame as the prompt.
```
python seggpt_inference.py \
--input_video examples/video_1.mp4 \
--prompt_target examples/video_1_target.png \
--output_dir ./
```

Processing a long video with prompts from both a target image and the predictions of the previous NUM_FRAMES frames.
```
NUM_FRAMES=4
python seggpt_inference.py \
--input_video examples/video_3.mp4 \
--prompt_target examples/video_3_target.png \
--num_frames $NUM_FRAMES \
--output_dir ./
```

## Description

### images
- inputs : row input images
- masks : mask, target images 

### output
- Generated images are stored in this directory.<br>
A directory named `YYYYMMDD_HHMMSS` will be created at inference time. 

### inference.sh
- segment a movie using 'inference_image()' from command line.
- Use `movieToImage.py` beforehand to prepare the movie as images.

<!-- <div align="center">
<image src="rainbow.gif" width="720px" />
</div> -->
