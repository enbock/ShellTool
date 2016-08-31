#!/bin/bash

run $UI fselect file $MODULES/

test -n "$file" && vi $file
