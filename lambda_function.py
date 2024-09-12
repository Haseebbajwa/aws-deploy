import json

def lambda_handler(event, context):
    # Log the event for debugging
    print("Received event:", json.dumps(event))
    
    # Check if httpMethod exists
    method = event.get('httpMethod')
    
    if not method:
        return {
            'statusCode': 400,
            'body': json.dumps({'error': 'Invalid event structure, no httpMethod found'})
        }
    
    # Process GET or POST request
    if method == 'GET':
        string_to_uppercase = event['queryStringParameters'].get('string', '')
    elif method == 'POST':
        body = json.loads(event['body'])
        string_to_uppercase = body.get('string', '')
    else:
        return {
            'statusCode': 400,
            'body': json.dumps({'error': 'Invalid request method'})
        }
    
    return {
        'statusCode': 200,
        'body': json.dumps({'uppercase': string_to_uppercase.upper()})
    }
