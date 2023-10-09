#!/usr/bin/env bash

find ~/.ssh -type f -name "*.pem" | xargs ssh-add
find ~/.ssh -type f -name "id_rsa_*" ! -name "*.pub" | xargs ssh-add
