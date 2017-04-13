#!/usr/bin/env bash

set -eux

docker run --rm -idt -p 20009:20009 -p 20008:20008 tilemill /usr/bin/monit -I
