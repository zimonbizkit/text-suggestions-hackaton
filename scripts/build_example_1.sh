#!/usr/bin/env bash

set -x

echo "--------------------------------------------------"
echo "Building suggestions example 1..."
echo "--------------------------------------------------"
echo "1.-Erasing previous index data?"

curl -g "http://0.0.0.0:8983/solr/retrotech/update" \
     -H 'Content-Type: application/json' \
     -d '{"delete":{"query":"*:*"}}'



echo "2.-Indexing retrotech dataset..."
docker exec -it notebooks sh -c "cd /tmp/notebooks/notebooks/example_1/scripts && python ./index_retrotech.py"

echo "3.-Building suggester component from index..."
curl http://0.0.0.0:8983/solr/retrotech/suggest?suggest.build=true

echo "---------------------------------------------------------"
echo " √ Suggestions example 1 has been built successfully!  √ "
echo "---------------------------------------------------------"