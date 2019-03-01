import json

import requests

def yesno(event, context):
    api_response = requests.get('https://yesno.wtf/api')
    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'text/plain',
        },
        'body': json.dumps(api_response.json()['answer'])
    }
