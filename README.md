**API Documentation: Uppercase-as-a-Service**
**Overview**
Uppercase-as-a-Service provides a simple API to convert text to uppercase. This service is designed to transform input strings to uppercase using a straightforward HTTP API.

**Base URL**
https://xn8pmstq6e.execute-api.eu-west-1.amazonaws.com/development

**Endpoints**
1. Convert String to Uppercase
Endpoint: /uppercase
Method: POST
Description: Converts the provided string to uppercase.
Request
Headers:
Content-Type: application/json
Body: JSON object containing the string to be converted.

{
  "string": "your_text_here"
}

**Response**
Status Code: 200 OK

Content-Type: application/json

Body: JSON object containing the uppercase version of the string.
{
  "uppercase": "YOUR_TEXT_HERE"
}
**Error Responses:**

**Status Code** : 400 Bad Request

Body:
{
  "error": "Empty body in request"
}
**Status Code** : 400 Bad Request
Body:
{
  "error": "Invalid JSON format"
}

**Example Usage**
**CURL Command**
To convert the string "hello" to uppercase, use the following curl command:

curl -X POST "https://<api-id>.execute-api.<region>.amazonaws.com/<stage>/uppercase" \
     -H "Content-Type: application/json" \
     -d '{"string": "hello"}'

**Response:**

{
  "uppercase": "HELLO"
}
