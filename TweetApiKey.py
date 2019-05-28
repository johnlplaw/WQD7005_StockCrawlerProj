import json

"""
Consumer API keys
2e2d6g434PXYOsQ91VYnZVdSj (API key)

QLcKkqFan5qcb6FML6LihANvdfqVNcbKpKVAWVSYQ5lW3lHKDZ (API secret key)

Regenerate
Access token & access token secret
1105024563786608640-bYnSfa8AsA1eb5yWXrQRMad8dNEsBv (Access token)

Bs80AllYJG8WUXihZECcd1Qx28gFm8VsXl3CfdK0J6skr (Access token secret)

Read and write (Access level)

"""

# Enter your keys/secrets as strings in the following fields
credentials = {}
credentials['CONSUMER_KEY'] = '2e2d6g434PXYOsQ91VYnZVdSj'
credentials['CONSUMER_SECRET'] = 'QLcKkqFan5qcb6FML6LihANvdfqVNcbKpKVAWVSYQ5lW3lHKDZ'
credentials['ACCESS_TOKEN'] = '1105024563786608640-bYnSfa8AsA1eb5yWXrQRMad8dNEsBv'
credentials['ACCESS_SECRET'] = 'Bs80AllYJG8WUXihZECcd1Qx28gFm8VsXl3CfdK0J6skr'

# Save the credentials object to file
with open("twitter_credentials.json", "w") as file:
    json.dump(credentials, file)
