import json
from faker import Faker

fake = Faker()

user_id=0
fake_data_store={}
while len(fake_data_store) < 5:
    user_id += 1
    fake_data_store[user_id]={ 'name': fake.name(), 'address': fake.address()}

def handler(event, context):
    print('log this')
    user_ID=int(event["user_id"])
    message=fake_data_store[user_ID]
    message_json=json.dumps(message)
    return message_json