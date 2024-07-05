import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

# setup
subprocess.run(["python", "../setup.py"])

output_path = "./src/output"
input_path = "./src/input"

## main

def download_images(url):

    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')

    img_tags = soup.find_all('img')

    for img in img_tags:
        img_url = img.get('src')
        if not img_url:
            continue
        img_url = urljoin(url, img_url)
        img_data = requests.get(img_url).content
        img_name = os.path.join(output_path, os.path.basename(img_url))

        with open(img_name, 'wb') as img_file:
            img_file.write(img_data)

        print(f'saved: {img_name}')

if __name__ == "__main__":
    url = input("enter website url: ")
    download_images(url, output_path)