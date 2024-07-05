import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

# Setup paths
output_path = "./src/output"

def download_images(url, output_path):

    # Make sure the output path exists
    os.makedirs(output_path, exist_ok=True)

    response = requests.get(url)
    if response.status_code != 200:
        print(f'Failed to retrieve {url} - Status code: {response.status_code}')
        return
    
    soup = BeautifulSoup(response.text, 'html.parser')

    img_tags = soup.find_all('img')

    for img in img_tags:
        img_url = img.get('src')
        if not img_url:
            continue
        img_url = urljoin(url, img_url)
        
        try:
            img_data = requests.get(img_url).content
        except requests.exceptions.RequestException as e:
            print(f'Failed to retrieve image from {img_url} - Error: {e}')
            continue
        
        img_name = os.path.join(output_path, os.path.basename(img_url))

        try:
            with open(img_name, 'wb') as img_file:
                img_file.write(img_data)
            print(f'Saved: {img_name}')
        except IOError as e:
            print(f'Failed to save image {img_name} - Error: {e}')

if __name__ == "__main__":
    url = input("Enter website URL: ")
    download_images(url, output_path)
