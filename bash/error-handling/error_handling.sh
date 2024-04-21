#!/usr/bin/env bash

error_handler() {
    echo "Usage: $0 <person>"
    exit 1
}

[ "$#" == 1 ] && echo "Hello, $1" || error_handler

