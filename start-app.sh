#!/bin/bash

if [ "$NEST_CONTAINER_TYPE" != test ]; then
  /bin/bash /usr/local/tree/nest/utils/start
fi
  
