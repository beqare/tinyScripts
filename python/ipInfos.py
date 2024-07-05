import requests
import subprocess

# setup
subprocess.run(["python", "../setup.py"])

output_path = "./src/output"
input_path = "./src/input"

## main


def show_ip_address():
    try:
        ip_response = requests.get("http://icanhazip.com")
        ip_address = ip_response.text.strip()

        api_url = f"http://ip-api.com/json/{ip_address}?fields=country,regionName,city,isp,lat,lon,timezone,as"

        api_response = requests.get(api_url)
        location_info = api_response.json()

        country = location_info.get("country")
        region = location_info.get("regionName")
        city = location_info.get("city")
        isp = location_info.get("isp")
        latitude = location_info.get("lat")
        longitude = location_info.get("lon")
        timezone = location_info.get("timezone")

        print(f"IP: {ip_address}")
        print(f"Location: {city}, {region}, {country}")
        print(f"ISP: {isp}")
        print(f"Latitude: {latitude}")
        print(f"Longitude: {longitude}")
        print(f"Timezone: {timezone}")

    except Exception as ex:
        print(f"An error occurred while fetching the IP address: {ex}")

    input("")


show_ip_address()
