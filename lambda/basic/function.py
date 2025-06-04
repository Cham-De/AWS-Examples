def lambda_handler(event, context):
    print("hello lamda func")
    return {
        'statusCode': 200,
        'body': 'Hello from Lambda!'
    }
