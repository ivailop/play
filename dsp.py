import sys
import requests
import os
import json

url = "https://api.github.com/repos/munderseth/play/dispatches"

headers = {
    'Content-Type': "application/json",
    'Accept': "application/vnd.github.everest-preview+json",
  }

# using dispatch access token from Personal access tokes: "dispatch"
# token added to Windows 10 Env. Var
gh_token = os.getenv('GH_Admin')

input = {
  "event_type": "play",
  "client_payload": {"p1": "default", "p2": "tbd"}
}

def main():
  global input

  payload = json.dumps(input)
  querystring = {"access_token":gh_token}

  response = requests.request("POST", url, data=payload, headers=headers, params=querystring)
  print(response.status_code)

if __name__ == "__main__":  # pragma: no cover
    main()
