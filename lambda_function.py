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
    
    # Initialize the string_to_uppercase variable
    string_to_uppercase = ""
    
    # Process GET or POST request
    if method == 'GET':
        # For GET requests, get the string from query parameters
        query_params = event.get('queryStringParameters', {})
        string_to_uppercase = query_params.get('string', '')
    elif method == 'POST':
        # For POST requests, parse the JSON body
        try:
            body_json = json.loads(event.get('body', '{}'))
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
