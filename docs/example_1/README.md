# Location-based text suggestions

It is possible that some [classified-ads-second-hand commerce apps](https://es.wallapop.com/) were 
conceived as a location-first search engine. That means that for each search we are having,
one critical factor for retrieval and/or ranking is how far the result is located from your current location.
Think of it this way: _If you are living in Helsinki, and you need to commute to purchase an item, would you purchase the first perfect result on your 
search if it's located in Rovaniemi?_

For this search problem, distance modelling becomes important to rank the results properly, from nearest to further. 
For this example, Solr has been suporting for a while [distance-based](https://solr.apache.org/guide/6_6/spatial-search.html)
searches with [some](https://solr.apache.org/guide/6_6/spatial-search.html) [methods](https://solr.apache.org/guide/6_6/spatial-search.html#SpatialSearch-bbox) that help
sorting their results by the distance from each other.

### How Solr processes distance-based searches
<span align="left">
For distance-based searches in its most simple form, Solr uses the [Haversine](https://en.wikipedia.org/wiki/Haversine_formula) algorithm

WIP
