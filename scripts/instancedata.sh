#!/bin/bash
curl -w "/n" http://169.254.169.254/latest/meta-data/local-hostname >> metadata.txt
curl -w "/n" http://169.254.169.254/latest/meta-data/iam/info >> metadata.txt
curl http://169.254.169.254/latest/meta-data/security-groups >> metadata.txt
