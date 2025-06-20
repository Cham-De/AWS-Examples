import boto3
import json

client = boto3.client('sts')
response = client.get_caller_identity()
##format the json response
response = json.dumps(response, indent=4)

print(response)