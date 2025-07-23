import requests
import json

def login_and_get_passwords():
    # First login
    login_url = 'https://password-manager-web.chal.irisc.tf/login'
    login_data = {
        "usr": "skat",
        "pwd": "rf=easy-its+just&spicysines123!@"
    }
    
    headers = {
        'Content-Type': 'text/plain;charset=UTF-8',
        'Origin': 'https://password-manager-web.chal.irisc.tf'
    }
    
    # Login to get the auth cookie
    login_response = requests.post(login_url, headers=headers, data=json.dumps(login_data))
    print("Login Status:", login_response.status_code)
    print("Login Response:", login_response.text)
    
    if login_response.status_code == 200:
        # Get passwords using the session cookie
        passwords_url = 'https://password-manager-web.chal.irisc.tf/getpasswords'
        passwords_response = requests.get(passwords_url, cookies=login_response.cookies)
        print("\nPasswords Status:", passwords_response.status_code)
        print("Passwords Response:", passwords_response.text)

login_and_get_passwords()
