#!/usr/bin/env bash

wget https://github.com/ai-powered-search/retrotech/raw/master/products.tgz
wget https://github.com/ai-powered-search/retrotech/raw/master/signals.tgz

tar -C ./data -xzvf products.tgz
tar -C ./data -xzvf signals.tgz

rm -f products.tgz
rm -f signals.tgz