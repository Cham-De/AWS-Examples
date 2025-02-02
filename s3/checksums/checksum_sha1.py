import hashlib
import base64

def sha1_base64_file(file_path):
    sha1 = hashlib.sha1()
    with open(file_path, 'rb') as f:
        while chunk := f.read(4096):  # Read in chunks
            sha1.update(chunk)
    digest = sha1.digest()  # Get raw bytes
    return base64.b64encode(digest).decode('utf-8')

file_path = "myfilechecksum.txt" 
checksum = sha1_base64_file(file_path)
print("SHA-1 Checksum (Base64):", checksum)
