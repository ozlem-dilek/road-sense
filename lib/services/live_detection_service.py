# live_detection_service.py
import torch
from flask import Flask
from flask_socketio import SocketIO, emit
import cv2
import base64
import numpy as np

app = Flask(__name__)
app.config['***key'] = 'key!'
socketio = SocketIO(app)

model = torch.hub.load('ultralytics/yolov8', 'custom', path='lib/assets/yolov8_model/best.pt')

@socketio.on('connect')
def handle_connect():
    print('Client connected')

@socketio.on('disconnect')
def handle_disconnect():
    print('Client disconnected')

@socketio.on('video_frame')
def handle_video_frame(data):
    img_data = base64.b64decode(data['frame'])
    np_arr = np.fromstring(img_data, np.uint8)
    frame = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

    results = model(frame)

    # Tespit sonuçlarını işle
    detections = []
    for result in results.xyxy[0]:  # x1, y1, x2, y2, confidence, class
        detections.append({
            'x1': result[0].item(),
            'y1': result[1].item(),
            'x2': result[2].item(),
            'y2': result[3].item(),
            'confidence': result[4].item(),
            'class': int(result[5].item())
        })

    emit('detections', detections)

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5003)
