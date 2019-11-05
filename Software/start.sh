#!/bin/sh

trap cleanup 1 2 3 6

cleanup()
{
    find . -type f -name '*.pyc' -exec rm {} +
    exit 0
}

./IAQ_Logger.py
cleanup
