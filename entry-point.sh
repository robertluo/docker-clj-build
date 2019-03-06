#!/bin/sh

if [ -n "$SSH_PRIVATE_KEY" ]; then
    eval $(ssh-agent -s)
    echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
fi

exec "$@"
