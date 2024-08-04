from flask import Flask, request, jsonify
import torch
from PIL import Image
import io

app = Flask(__name__)

# Yolov8 modelini yükle
model = torch.hub.load('ultralytics/yolov8', 'custom', path='lib/assets/yolov8_model/best.pt', trust_repo = True)

@app.route('/predict/photo', methods=['POST'])
def predict_photo():
    if 'image' not in request.files:
        return jsonify({'error': 'No image provided'}), 400

    file = request.files['image']
    image = Image.open(io.BytesIO(file.read()))

    # Tespit işlemi
    results = model(image)

    # Tespit sonuçlarını JSON formatında döndür
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

    return jsonify(detections)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
