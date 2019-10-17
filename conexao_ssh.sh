#!/bin/bash

# suporte de ssh para equipamentos antigos
ssh -v \
-o HostKeyAlgorithms=ssh-dss \
-o KexAlgorithms=diffie-hellman-group1-sha1 \
-o Ciphers=aes192-cbc,3des-cbc \
usuario@host
