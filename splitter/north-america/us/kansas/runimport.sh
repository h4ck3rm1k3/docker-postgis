export PATH=$PATH:/opt/osmosis/package/bin:/opt/golang/src/github.com/omniscale/imposm3/

imposm3 \
    import \
    -connection postgis://docker:docker@db/routing \
    -mapping /opt/golang/src/github.com/omniscale/imposm3/test/complete_db_mapping.json \
    -read /var/lib/splitter/north-america/us/kansas/kansas-latest.osm.pbf \
    -write
