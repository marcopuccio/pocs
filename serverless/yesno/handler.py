import requests

def yesno(event, context):
    api_response = requests.get('https://yesno.wtf/api')
    return {
        'statusCode': 200,
        'anwser': api_response.json()['answer']
    }
