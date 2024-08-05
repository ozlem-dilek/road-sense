from flask import Flask, request, jsonify
import torch
import cv2
import numpy as np
import io

app = Flask(__name__)

model = torch.hub.load('ultralytics/yolov8', 'custom', path='lib/assets/yolov8_model/best.pt')

@app.route('/predict/video', methods=['POST'])
def predict_video():
    if 'video' not in request.files:
        return jsonify({'error': 'No video provided'}), 400

    file = request.files['video']
    video_bytes = file.read()
    video = cv2.VideoCapture(io.BytesIO(video_bytes))

    frames = []
    while True:
        ret, frame = video.read()
        if not ret:
            break
        results = model(frame)
        frames.append(results.render()[0])


    output_path = 'output_video.mp4'
    height, width, _ = frames[0].shape
    out = cv2.VideoWriter(output_path, cv2.VideoWriter_fourcc(*'mp4v'), 20.0, (width, height))
    for frame in frames:
        out.write(frame)
    out.release()

    return jsonify({'output_path': output_path})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)
