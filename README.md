# Text suggestions hackaton

This repository holds a small hands-on session to explore few ways of 
implementing text suggestions using Solr as a store for them. Some points:
- The aim is not using Solr as a whole for the text suggestions generation and ranking, but use it as a token/shingle/text store and let the inception of the suggestions happen outside.
  - We'll mostly use Solr to provide a blend of prefixed infixed suggestions.
- The aim would be to build these suggestions whenever this repository is downloaded, and executed through either Solr web UI or CLI, regardless how they were generated. 
  - There would be some exceptions for some examples but mostly we'll use Solr.
- You should be familiar (or willing to play) with at least a bit of Python, a bit of Java, and a bit of Scala

---
## Examples

1.  **[Location-based text suggestions](docs/example_1/README.md)** with latitude/longitude modelling and [Geohashes](https://en.wikipedia.org/wiki/Geohash) [⚙️Work in progress, mostly done]    
2.  **"Relevance" based** iterations with supply/demand-based logic  
3. **Using [Point-wise Mutual Information (PMI)](https://en.wikipedia.org/wiki/Pointwise_mutual_information)** index to
generate next autocomplete token on text suggestions [⚙️Work in progress, generation but no indexation]


---
### Requisites
 - `docker`
 - `docker-compose`
 - `wget`
 - `make` command
 
### What comes with this repository
On the `docker-compose.yml` we have
- A solr9 local instance
- A mostly-fully-fledged `jupyter` environment with a Python kernel, whose main packages are
- An [AWS Glue](https://aws.amazon.com/glue/) [containerized environment](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-libraries.html) to execute some examples. 
  - Docker image is quite heavy so it is for the moment commented out from docker-compose for other examples

The idea for this structure is that we are providing the building blocks for suggestions with other tools (being them a jupyter environment or local AWS Glue) rather than plain Solr
and we index them once they are ready. 

### For the early probers
Please execute on your terminal

```bash
 $ make down && make up && sleep 15 && make build_suggestions_1
```

