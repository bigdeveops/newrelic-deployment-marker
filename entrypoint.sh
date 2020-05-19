#!/bin/sh

RED='\033[0;31m'
NO_COLOR='\033[0m'

echo ""
echo "User: ${NEW_RELIC_USER}"
echo ""

result=$(newrelic apm deployment create --applicationId "${APPLICATION_ID}" --revision "${REVISION}" --user "${NEW_RELIC_USER}" 2>&1)

exitStatus=$?

if [ $exitStatus -ne 0 ]; then
  printf "${RED}Error:${NO_COLOR} $result"
fi

exit $exitStatus
