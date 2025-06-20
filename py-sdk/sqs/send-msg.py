import boto3
import json
from botocore.exceptions import ClientError, ParamValidationError

client = boto3.client('sqs')

try:
    response = client.send_message(
        QueueUrl='https://sqs.ap-south-1.amazonaws.com/647264525674/my-queue-from-boto3',
        MessageBody='hello boto3 queue!',
        DelaySeconds=0,
        MessageAttributes={
            'sdk': {
                'StringValue': 'boto3',
                'DataType': 'String'
            }
        }
    )
    response = json.dumps(response, indent=4)
    print(response)
except Exception as e:
    print(e)