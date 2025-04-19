#!/bin/sh

echo "Hello from $USER_NAME!"
echo "Your role is: $ROLE"
echo "🔐 Secret token: $(cat /run/secrets/app_token)"
