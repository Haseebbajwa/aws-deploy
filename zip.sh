#!/bin/bash

# Define the filename for the zip
ZIP_FILE="lambda_function.zip"

# Remove old zip file if it exists
if [ -f $ZIP_FILE ]; then
    rm $ZIP_FILE
fi

# Zip the Python file
zip $ZIP_FILE lambda_function.py

echo "$ZIP_FILE created successfully."

