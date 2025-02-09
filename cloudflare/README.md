# Cloudflare Dynamic DNS Updater

This script updates a Cloudflare DNS record with the current public IP address. It is useful for maintaining a dynamic DNS setup where your IP address may change frequently.

## Features
- Retrieves the current public IP address
- Fetches the Cloudflare DNS record ID for a specified domain
- Updates the Cloudflare DNS record with the current IP
- Supports logging at different levels (info, debug)

## Prerequisites
- Python 3.x
- Cloudflare account with API access
- `requests` and `python-dotenv` libraries (install using `pip install -r requirements.txt`)

## Installation and usage
1. Clone this repository or download the script.
2. Create a python virtual environment:
    ```sh
    python -m venv venv
    ```
3. Activate the virtual environment:
    ```sh
    source ./venv/bin/activate
    ```
4. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
5. Build the script:
    ```
    pyinstaller ./cloudflare-update-dns.py --onefile
    ```
6. Create a `.env` file in the project root with the following contents:
   ```env
   ZONE_ID=your_zone_id
   RECORD_NAME=your_record_name
   API_KEY=your_api_key
   EMAIL=your_email
   ```
7. Run the binary, located in the `dist/` directory.
8. Create a cron job to run this binary every 5 minutes.

### Arguments:
- `--log-level` (optional): Set logging level (`info` or `debug`). Default is `none`.

## How It Works
1. Loads environment variables from `.env`.
2. Fetches the Cloudflare DNS record ID.
3. Retrieves the current public IP.
4. Updates the Cloudflare DNS record with the new IP.

## Error Handling
- The script will raise an error if any required environment variable is missing.
- Connection errors when fetching public IP or updating Cloudflare records will be reported.

## Future work

- [ ] Automatic message a discord channel or whatsapp contact if there are consecutive errors with the DNS update
