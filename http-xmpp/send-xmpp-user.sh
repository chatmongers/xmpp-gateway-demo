#!/bin/bash

# Sending as an admin requires the API authentication credentials
xmpp_user="myxmppuser"
xmpp_password="testing"

# Messages will appear to be from '$xmpp_user@$domain_name'
domain_name=".chatwith.it"
# Services like google talk that implement privacy extensions will require that
# this sender be in the receiving user's roster.

read -d '' message << EOF
{
	"to": "someuser@.chatwith.it",
	"body": "This is a test message from the API"
}
EOF

curl -v -X POST https://manager.chatmongers.com/api/1.0/xmppdomains/$domain_name/gateway/messages \
	-u $xmpp_user:$xmpp_password -d "$message" -H "Content-type: application/json"


