#!/bin/bash

grep mailto $1 | sed -E 's/.*mailto:([a-z0-9]+)@.*>(.+),(.+)<\/a>.*/\3 \2,\1/'
