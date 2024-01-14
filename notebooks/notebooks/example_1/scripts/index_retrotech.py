import pandas as pd
import requests
import json

# Load your products dataset
# For example: df = pd.read_csv('path_to_your_products_dataset.csv')
# Make sure to replace 'path_to_your_products_dataset.csv' with the actual path to your products dataset

def index_batch_to_solr(batch_data, solr_url, solr_core):
    """
    Index a batch of data to Solr.
    """
    headers = {'Content-type': 'application/json'}
    data = json.dumps(batch_data)
    response = requests.post(f'{solr_url}/{solr_core}/update?commitWithin=1000', data=data, headers=headers)
    return response

def batch_indexing(df, batch_size, solr_url, solr_core):
    """
    Index data in batches.
    """
    for i in range(0, len(df), batch_size):
        batch = df.iloc[i:i + batch_size].to_dict(orient='records')

        print(f"Indexing batch" + str(i))
        response = index_batch_to_solr(batch, solr_url, solr_core)
        if response.status_code != 200:
            print(f"Error indexing batch {i // batch_size}: {response.text}")

# Parameters
df = pd.read_csv('./../products_with_location.csv')
solr_url = 'http://solr:8983/solr'  # Replace with your Solr URL
solr_core = 'retrotech'  # Replace with your Solr core name
batch_size = 10  # Number of records per batch

# Perform the batch indexing

df = df[['upc','name','manufacturer','shortDescription','longDescription','latitude','longitude','geohash']]
df['location'] = df['latitude'].astype(str) + ',' + df['longitude'].astype(str)
df = df[['upc','name','manufacturer','shortDescription','longDescription','location','geohash']]
df.head(10)
batch_indexing(df, batch_size, solr_url, solr_core)