import boto3
import json
from botocore.exceptions import ClientError, ParamValidationError

client = boto3.client('sqs')
try:
    response = client.receive_message(
        QueueUrl='https://sqs.ap-south-1.amazonaws.com/647264525674/my-queue-from-boto3',
        AttributeNames=[
        'All'
    ]
    )
    messages = response.get("Messages", [])
    if messages:
        receipt_handle = messages[0]["ReceiptHandle"]
        print(receipt_handle)
        ##delete the message
        delete_response = client.delete_message(
        QueueUrl='https://sqs.ap-south-1.amazonaws.com/647264525674/my-queue-from-boto3',
        ReceiptHandle=receipt_handle
        )
    else:
        print("No messages received.")
except Exception as e:
    print(e)