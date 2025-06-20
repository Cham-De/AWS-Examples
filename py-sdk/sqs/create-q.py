import boto3
import json
#from botocore.exceptions import ClientError, ParamValidationError

client = boto3.client('sqs')
try:
    response = client.create_queue(
    QueueName='my-queue-from-boto3'
    )
    response = json.dumps(response, indent=4)
    print(response)
except Exception as e:
    print(e)
