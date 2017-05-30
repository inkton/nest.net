#!/bin/bash

if [ -f /var/app/app.nest ]; then
	/bin/bash /usr/local/tree/nest/utils/start |& tee /tmp/start.log
else
	tail -f /dev/null
fi
  
