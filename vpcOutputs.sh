#! /bin/bash

terraform output -raw proddb-endpoint
terraform output -raw testdb-endpoint