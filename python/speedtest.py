import time
import requests
import statistics
import subprocess

# setup
subprocess.run(["python", "../setup.py"])

output_path = "./src/output"
input_path = "./src/input"

## main


def check_internet_speed():
    num_tests = 5
    url = "https://snoopti.de/download/speedtest1mb.zip"
    results = []

    print(f"Running {num_tests} tests...")

    for i in range(1, num_tests + 1):
        start_time = time.time()

        try:
            response = requests.get(url, timeout=30)
            response.raise_for_status()
            data = response.content
        except requests.exceptions.RequestException as ex:
            print(f"Error: {ex}")
            continue

        end_time = time.time()
        elapsed_time = end_time - start_time

        speed_in_mbps = calculate_speed(elapsed_time)
        print(f"Test {i}: {speed_in_mbps:.2f} Mbps")
        results.append(speed_in_mbps)

        time.sleep(5)

    average_speed = statistics.mean(results) if results else 0
    print(f"\nAverage speed over {len(results)} tests: {average_speed:.2f} Mbps")


def calculate_speed(elapsed_time):
    file_size_in_bytes = 1024 * 1024
    bits_in_byte = 8
    bytes_per_second = file_size_in_bytes / elapsed_time
    bits_per_second = bytes_per_second * bits_in_byte
    speed_in_mbps = bits_per_second / 1024 / 1024
    return speed_in_mbps


check_internet_speed()

input("")
