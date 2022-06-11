unconscious new relic with php sample.
=======

the repo/code are sample for my talk at NRUG (New Relic User Group) Vol.3. 

[NRUG (New Relic User Group) Vol.3](https://nrug.connpass.com/event/247057/) 2022/06/15

# this is unconscious sample.

NOT USE in production.

but don't wait "right way". let's use New Relic now!!!

fyi: the Right way here. https://docs.newrelic.com/

# FYI

sign up newrelic and get api (ingest) key.

```
# setup
cp .env.sample .env
vi .env 

# build and up
docker-compose build 
docker-compose up -d

# load page.
open http://localhost:8080

# up syslog-ng
docker-compose exec web bash -c "syslog-ng --no-caps"
```

