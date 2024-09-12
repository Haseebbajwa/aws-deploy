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
    
    # Initialize variable for the string to uppercase
    string_to_uppercase = ''

    # Process GET or POST request
    if method == 'GET':
        # Ensure 'queryStringParameters' key exists and is a dictionary
        query_params = event.get('queryStringParameters', {})
        string_to_uppercase = query_params.get('string', '')
    elif method == 'POST':
        # Ensure 'body' key exists and is a string
        body = event.get('body', '{}')
        try:
            body_json = json.loads(body)
            string_to_uppercase = body_json.get('string', '')
        except json.JSONDecodeError:
            return {
                'statusCode': 400,
                'body': json.dumps({'error': 'Invalid JSON in request body'})
            }
    else:
        return {
            'statusCode': 400,
            'body': json.dumps({'error': 'Invalid request method'})
        }
    
    # Return the uppercase string
    return {
        'statusCode': 200,
        'body': json.dumps({'uppercase': string_to_uppercase.upper()})
    }

