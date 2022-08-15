# dhis2-sample


# HOW TO BUILD AND RUN

```
./build-and-run.sh imagetag
```

imagetag are tag that be used to build i.e.: `./build-and-run.sh testing` will create 2 images (`base:testing` and `core:testing`) when building. The main image are `core:testing` and it will used in docker-compose.yml through `.env` file

## HOW TO STOP 

```
docker-compose -f docker-compose/cluster/docker-compose.yml stop
```