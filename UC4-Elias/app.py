from flask import Flask, request, jsonify, send_from_directory, abort
from flask_cors import CORS  # Optional, for handling CORS
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes (optional)

# Configuration
UPLOAD_FOLDER = 'uploaded_files'
RETRIEVE_FOLDER = 'retrieve_files'
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['RETRIEVE_FOLDER'] = RETRIEVE_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024  # 16 MB limit

# Ensure upload directories exist
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
os.makedirs(RETRIEVE_FOLDER, exist_ok=True)

def allowed_file(filename):
    return '.' in filename and \
        filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

# ------------------------- Routes ------------------------- #

@app.route('/api/data', methods=['POST'])
def upload_file():
    """
    Endpoint to upload a file to the server.
    """
    if 'file' not in request.files:
        return jsonify({'error': 'No file part in the request'}), 400

    file = request.files['file']

    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        save_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(save_path)
        return jsonify({'message': f'File {filename} uploaded successfully.'}), 200
    else:
        return jsonify({'error': 'File type not allowed'}), 400

@app.route('/api/data/retrieve', methods=['GET'])
def retrieve_file():
    """
    Endpoint to retrieve a specific file from the server.
    The client must provide a 'filename' query parameter.
    Example: /api/data/retrieve?filename=data.txt
    """
    filename = request.args.get('filename')
    if not filename:
        return jsonify({'error': 'No filename provided'}), 400

    # Secure the filename to prevent directory traversal attacks
    filename = secure_filename(filename)

    file_path = os.path.join(app.config['RETRIEVE_FOLDER'], filename)

    if os.path.isfile(file_path):
        return send_from_directory(app.config['RETRIEVE_FOLDER'], filename, as_attachment=True)
    else:
        return jsonify({'error': f'File {filename} not found'}), 404

# Optional: Endpoint to list available files for retrieval
@app.route('/api/data/list', methods=['GET'])
def list_files():
    """
    Lists all files available for retrieval.
    """
    try:
        files = os.listdir(app.config['RETRIEVE_FOLDER'])
        return jsonify({'files': files}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

# ------------------------- Main Entry Point ------------------------- #

if __name__ == '__main__':
    # Run the Flask app on all available IPs on port 5000
    app.run(host='0.0.0.0', port=5000, debug=True)
