import cv2
import os

def video_to_frames(video_path, output_folder):
    # 動画を読み込む
    cap = cv2.VideoCapture(video_path)
    
    # 出力フォルダが存在しない場合は作成する
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)
    
    frame_count = 0
    while True:
        ret, frame = cap.read()
        if not ret:
            break
        
        # フレームを画像として保存する
        frame_filename = os.path.join(output_folder, f'frame_{frame_count:04d}.png')
        cv2.imwrite(frame_filename, frame)
        
        frame_count += 1
        break
    
    cap.release()
    print(f'Total {frame_count} frames saved in {output_folder}')

# 使用例
video_path = 'images/inputs/knife.mp4'
output_folder = './outputs/'
video_to_frames(video_path, output_folder)
