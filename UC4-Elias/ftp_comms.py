import ftplib
import requests
import os
import sys
from io import BytesIO

# ------------------------- Configuration ------------------------- #

# FTP Configuration for Pepper Robot
FTP_HOST = '10.10.42.68'       # Replace with Pepper's IP address
FTP_PORT = 21                     # Default FTP port is 21
FTP_USER = 'nao'
FTP_PASS = 'nao'

'''# HTTP Server Configuration
HTTP_SERVER_URL = 'https://yourserver.com/api/data'  # Replace with your server's API endpoint
HTTP_RETRIEVE_URL = 'https://yourserver.com/api/data/retrieve'  # Endpoint to retrieve data
'''
# HTTP Server Configuration
HTTP_SERVER_URL = os.getenv('HTTP_SERVER_URL', 'http://192.168.8.128:5000/api/data')
HTTP_RETRIEVE_URL = os.getenv('HTTP_RETRIEVE_URL', 'http://192.168.8.128:5000/api/data/retrieve?filename=upload_data.txt')

# File Paths
ROBOT_FILE_PATH = '/path/on/robot/data.txt'   # Path to the file on the robot
LOCAL_DOWNLOAD_PATH = "uploaded_files"   # Local path to save downloaded file
LOCAL_UPLOAD_PATH = "uploaded_files"         # Local path of the file to upload to the robot

# ------------------------- FTP Functions ------------------------- #

def download_file_from_robot(ftp, remote_path, local_path):
    """
    Downloads a file from the robot via FTP.

    :param ftp: ftplib.FTP object
    :param remote_path: Path to the file on the robot
    :param local_path: Local path to save the downloaded file
    """
    try:
        with open(local_path, 'wb') as f:
            ftp.retrbinary(f'RETR {remote_path}', f.write)
        print(f"Successfully downloaded {remote_path} to {local_path}")
    except ftplib.all_errors as e:
        print(f"FTP download error: {e}")

def upload_file_to_robot(ftp, local_path, remote_path):
    """
    Uploads a file to the robot via FTP.

    :param ftp: ftplib.FTP object
    :param local_path: Local path of the file to upload
    :param remote_path: Path on the robot where the file will be saved
    """
    try:
        with open(local_path, 'rb') as f:
            ftp.storbinary(f'STOR {remote_path}', f)
        print(f"Successfully uploaded {local_path} to {remote_path}")
    except ftplib.all_errors as e:
        print(f"FTP upload error: {e}")

# ------------------------- HTTP Functions ------------------------- #

def send_data_to_server(file_path, server_url):
    """
    Sends data to the server via HTTP POST.

    :param file_path: Path to the local file to send
    :param server_url: Server's HTTP endpoint URL
    """
    try:
        with open(file_path, 'rb') as f:
            files = {'file': (os.path.basename(file_path), f)}
            response = requests.post(server_url, files=files)
        if response.status_code == 200:
            print(f"Data successfully sent to server. Server response: {response.text}")
        else:
            print(f"Failed to send data to server. Status code: {response.status_code}, Response: {response.text}")
    except requests.exceptions.RequestException as e:
        print(f"HTTP POST error: {e}")
    except FileNotFoundError:
        print(f"File not found: {file_path}")

def retrieve_data_from_server(server_url, save_path):
    """
    Retrieves data from the server via HTTP GET and saves it locally.

    :param server_url: Server's HTTP endpoint URL
    :param save_path: Local path to save the retrieved data
    """
    try:
        response = requests.get(server_url)
        if response.status_code == 200:
            with open(save_path, 'wb') as f:
                f.write(response.content)
            print(f"Data successfully retrieved from server and saved to {save_path}")
        else:
            print(f"Failed to retrieve data from server. Status code: {response.status_code}, Response: {response.text}")
    except requests.exceptions.RequestException as e:
        print(f"HTTP GET error: {e}")

# ------------------------- Main Execution ------------------------- #

def main():
    # Connect to FTP server
    try:
        ftp = ftplib.FTP()
        ftp.connect(FTP_HOST, FTP_PORT)
        ftp.login(FTP_USER, FTP_PASS)
        print(f"Connected to FTP server at {FTP_HOST}:{FTP_PORT}")
    except ftplib.all_errors as e:
        print(f"Failed to connect/login to FTP server: {e}")
        sys.exit(1)

    # Example 1: Download file from robot and send to server
    download_file_from_robot(ftp, ROBOT_FILE_PATH, LOCAL_DOWNLOAD_PATH)
    send_data_to_server(LOCAL_DOWNLOAD_PATH, HTTP_SERVER_URL)

    # Example 2: Retrieve data from server and upload to robot
    retrieve_data_from_server(HTTP_RETRIEVE_URL, LOCAL_UPLOAD_PATH)
    upload_file_to_robot(ftp, LOCAL_UPLOAD_PATH, ROBOT_FILE_PATH)

    # Close FTP connection
    ftp.quit()
    print("FTP connection closed.")

if __name__ == '__main__':
    main()



# curl -X GET "http://192.168.8.128:5000/api/data/retrieve?filename=upload_data.txt" --output retrieved_data.txt
# curl -X POST -F "file=@/path/to/your/upload_data.txt" http://192.168.8.128:5000/api/data
