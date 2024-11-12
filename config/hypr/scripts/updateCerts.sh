#!/bin/bash

# Variables
REMOTE_USER=media          # Change to your remote username
REMOTE_HOST=docker.primo.com     # Change to your remote host address
REMOTE_CERT_PATH=/home/media/my-local-ca/ca.crt  # Path to the CA cert on the remote machine
LOCAL_TEMP_PATH=/home/primo/ca.crt
LOCAL_CERT_PATH=/etc/ca-certificates/trust-source/anchors/ca.crt

# Transfer the certificate
scp "$REMOTE_USER@$REMOTE_HOST:$REMOTE_CERT_PATH" "$LOCAL_TEMP_PATH"

# Check if the transfer was successful
if [ $? -eq 0 ]; then

    echo "Certificate transferred successfully."
    
    # Update the trusted CA store
    sudo mv $LOCAL_TEMP_PATH $LOCAL_CERT_PATH
    sudo trust extract-compat

    echo "Trust store updated."
else
    echo "Failed to transfer the certificate."
fi
