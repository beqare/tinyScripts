import requests
import json
import subprocess
import asyncio

# setup
subprocess.run(["python", "../setup.py"])

output_path = "./src/output"
input_path = "./src/input"

## main

async def webhook_sender():
    webhook_url = input("Enter Webhook URL: ")

    try:
        valid_url = requests.utils.requote_uri(webhook_url)
    except ValueError:
        print("Invalid URL!")
        return

    while True:
        message_text = input("\nMessage: ")

        if message_text.lower() == "quit":
            print("Exiting the program.")
            break

        await send_message_to_discord_webhook(valid_url, message_text)


async def send_message_to_discord_webhook(webhook_url, message_text):
    payload = {"content": message_text}

    headers = {"Content-Type": "application/json"}

    try:
        response = requests.post(webhook_url, data=json.dumps(payload), headers=headers)

        if response.status_code != 204:
            print(f"Failed to send message: {response.status_code} - {response.reason}")

    except requests.RequestException as ex:
        print(f"An error occurred: {ex}")


if __name__ == "__main__":
    asyncio.run(webhook_sender())
