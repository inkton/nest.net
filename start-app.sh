
#!/bin/bash

if [ "$NEST_CONTAINER_TYPE" != "test" ] && [ -f /var/app/app.nest ]; then
  /bin/bash /usr/local/tree/nest/utils/start |& tee /tmp/start.log
else
  echo "running in test mode" > /tmp/start.log
fi
  
