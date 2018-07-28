#!/bin/bash
commit=`git log -n 1 --oneline | sed 's/\(.......\).*/\1/'`
docker build -t andykuszyk/nginx:$commit .
docker push andykuszyk/nginx:$commit
sed -i "s/\[version\]/$commit/g" docker-compose.yml
