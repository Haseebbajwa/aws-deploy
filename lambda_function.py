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
    
    # Initialize string_to_uppercase variable
    string_to_uppercase = ''
    
    # Process GET or POST request
    if method == 'GET':
        string_to_uppercase = event.get('queryStringParameters', {}).get('string', '')
    elif method == 'POST':
        body = event.get('body')
        if body:
            try:
                body_json = json.loads(body)
                string_to_uppercase = body_json.get('string', '')
            except json.JSONDecodeError:
                return {
                    'statusCode': 400,
                    'body': json.dumps({'error': 'Invalid JSON format'})
                }
        else:
            return {
                'statusCode': 400,
                'body': json.dumps({'error': 'Empty body in request'})
            }
    else:
        return {
            'statusCode': 400,
            'body': json.dumps({'error': 'Invalid request method'})
        }
    
    # Return response
    return {
        'statusCode': 200,
        'body': json.dumps({'uppercase': string_to_uppercase.upper()}),
        'headers': {
            'Content-Type': 'application/json'
        },
        'isBase64Encoded': False
    }
