import requests
import os
from dotenv import load_dotenv
import argparse

CLOUDFLARE_API_URL = 'https://api.cloudflare.com/client/v4'
LOG_LEVELS = ['none', 'info', 'debug']
LOG_LEVEL = 'none'

# logging
def log(message, level='info'):
    if level not in LOG_LEVELS:
        raise ValueError(f"Invalid log level: {level}. Valid levels are: {', '.join(LOG_LEVELS)}")

    if (level == 'info' and LOG_LEVEL == 'info') or (LOG_LEVEL == 'debug' and level in ['info', 'debug']):
        print(f'[{level}] {message}')

# get cloudlflare records list
def get_cloudflare_records(zone_id, record_name, api_key, email):
    """
    Retrieves the Cloudflare DNS record ID for a given zone and record name.

    Args:
        zone_id (str): The ID of the Cloudflare zone.
        record_name (str): The name of the DNS record to retrieve.
        api_key (str): The Cloudflare API key.
        email (str): The email associated with the Cloudflare account.

    Returns:
        str: The ID of the requested DNS record.

    Raises:
        ConnectionError: If there is an error fetching the Cloudflare records or if the record is not found.
    """
    res = None
    try:
        res = requests.get(
            f'{CLOUDFLARE_API_URL}/zones/{zone_id}/dns_records',
            headers={'X-Auth-Email': email, 'X-Auth-Key': api_key}
        )
        res.raise_for_status()
        if res.status_code != 200:
            raise ConnectionError(f"Error fetching Cloudflare records: {res.json()}")

    except requests.RequestException as e:
        raise ConnectionError(f"Error fetching Cloudflare records: {e}")

    res = res.json()
    log(f"Cloudflare records: {res}", 'debug')

    requested_record_ids = ''
    for record in res['result']:
        if record['name'] == record_name:
            requested_record_ids = record['id']

    if not requested_record_ids:
        raise ConnectionError(f"Error fetching Cloudflare records: Record with name {record_name} not found")

    return requested_record_ids

# update cloudflare record
def update_cloudflare_record(record_name, record_id, zone_id, current_ip, api_key, email):
    """
    Updates a Cloudflare DNS record with the current IP address.

    Args:
        record_name (str): The name of the DNS record to update.
        record_id (str): The ID of the DNS record to update.
        zone_id (str): The ID of the Cloudflare zone.
        current_ip (str): The current public IP address.
        api_key (str): The Cloudflare API key.
        email (str): The email associated with the Cloudflare account.

    Raises:
        ConnectionError: If there is an error updating the Cloudflare record.
    """

    url = f'{CLOUDFLARE_API_URL}/zones/{zone_id}/dns_records/{record_id}'
    headers = {
        'X-Auth-Email': email,
        'X-Auth-Key': api_key,
        'content-type': 'application/json'
    }
    data = {
      "comment": "Domain verification record",
      "content": current_ip,
      "name": record_name,
      "proxied": True,
      "ttl": 600,
      "type": "A"
    }

    try:
        res = requests.put(
            url,
            headers=headers,
            json=data
        )
        res.raise_for_status()
        if res.status_code != 200:
            raise ConnectionError(f"Error updating Cloudflare record: {res.json()}")

        res = res.json()

        log(f"Cloudflare record updated: {res}", 'info')

    except requests.RequestException as e:
        raise ConnectionError(f"Error updating Cloudflare record: {e}")

# get public ip
def get_public_ip():
    """
    Retrieves the current public IP address.

    Returns:
        str: The current public IP address.

    Raises:
        ConnectionError: If there is an error fetching the public IP address.
    """
    try:
        res = requests.get('https://api.ipify.org?format=json', timeout=5)
        res.raise_for_status()
        log(f"Public IP: {res.json()['ip']}", 'debug')

        return res.json()['ip']
    except requests.RequestException as e:
        raise ConnectionError(f"Error fetching public IP: {e}")

# main function
def main():
    """
    Main function to update Cloudflare DNS record with the current public IP address.

    This function performs the following steps:
    1. Loads environment variables from a .env file.
    2. Retrieves the required environment variables: ZONE_ID, RECORD_NAME, API_KEY, EMAIL.
    3. Checks if all required environment variables are present.
    4. Gets the Cloudflare record ID for the specified zone and record name.
    5. Retrieves the current public IP address.
    6. Updates the Cloudflare DNS record with the current public IP address.

    Raises:
        EnvironmentError: If any of the required environment variables are missing.
    """
    # get env vars from .env file
    load_dotenv()
    zone_id = os.getenv('ZONE_ID')
    record_name = os.getenv('RECORD_NAME')
    api_key = os.getenv('API_KEY')
    email = os.getenv('EMAIL')

    if not all([zone_id, record_name, api_key, email]):
        raise EnvironmentError("""Missing required environment variables.

Please create a .env file in the root of the project with the following variables:
ZONE_ID=your_zone_id
RECORD_NAME=your_record_name
API_KEY=your_api_key
EMAIL=your_email
""")

    record_id = get_cloudflare_records(zone_id, record_name, api_key, email)
    current_ip = get_public_ip()
    update_cloudflare_record(record_name, record_id, zone_id, current_ip, api_key, email)

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Update Cloudflare DNS record with current public IP')
    parser.add_argument('--log-level', type=str, default='none', help='Log level: info or debug')
    args = parser.parse_args()

    LOG_LEVEL = args.log_level

    main()
