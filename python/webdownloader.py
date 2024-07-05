import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
from collections import Counter

# Setup paths
output_path = "./src/output"

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def scan_files(url, tag_name, attribute):
    response = requests.get(url)
    if response.status_code != 200:
        print(f'Failed to retrieve {url} - Status code: {response.status_code}')
        return []
    
    soup = BeautifulSoup(response.text, 'html.parser')
    media_tags = soup.find_all(tag_name)

    media_urls = []
    for media in media_tags:
        media_url = media.get(attribute)
        if not media_url:
            continue
        media_url = urljoin(url, media_url)
        media_urls.append(media_url)
    
    return media_urls

def download_files(media_urls, output_path):
    os.makedirs(output_path, exist_ok=True)

    for media_url in media_urls:
        try:
            media_data = requests.get(media_url).content
        except requests.exceptions.RequestException as e:
            print(f'failed {media_url} - error: {e}')
            continue
        
        media_name = os.path.join(output_path, os.path.basename(media_url))

        try:
            with open(media_name, 'wb') as media_file:
                media_file.write(media_data)
            print(f'saved: {media_name}')
        except IOError as e:
            print("")
            print(f'failed {media_name} - error: {e}')
            print("")

def main():
    clear_screen()
    print("WEB-DOWNLOADER by snoopti")
    print("")
    url = input("insert url » ")

    while True:
        print("download type:")
        print("[1] Images")
        print("[2] Audio")
        print("[3] Video")
        print("")
        print("[0] Exit")
        print("")
        choice = input("input » ")

        if choice == "1":
            tag_name, attribute = 'img', 'src'
        elif choice == "2":
            tag_name, attribute = 'audio', 'src'
        elif choice == "3":
            tag_name, attribute = 'video', 'src'
        elif choice == "4":
            break
        else:
            clear_screen()
            print("invalid choice")
            continue
        
        media_urls = scan_files(url, tag_name, attribute)
        if not media_urls:
            clear_screen()
            print("nothing found")
            continue
        
        file_types = Counter([os.path.splitext(media_url)[1].lower() for media_url in media_urls])
        clear_screen()
        print(f'{len(media_urls)} files found:')
        print("")
        for file_type, count in file_types.items():
            print(f'{file_type.upper()} ({count})')

        print("")
        print("[1] download")
        print("[2] back")
        print("")
        sub_choice = input("input » ")

        if sub_choice == "1":
            clear_screen()
            download_files(media_urls, output_path)
        elif sub_choice == "2":
            continue
        else:
            clear_screen()
            print("invalid choice")

if __name__ == "__main__":
    main()

