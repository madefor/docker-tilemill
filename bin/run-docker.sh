#!/usr/bin/env bash

set -eux

docker run --rm -t -i -p 20009:20009 -p 20008:20008 tilemill /bin/bash
