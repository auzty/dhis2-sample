# dhis2-sample


# HOW TO BUILD

## Building Base Dhis-2

1. Build base image

    path : `./`

    ```bash
    docker build -t base:test
    ```

2. Extract artifacts

    path : `./`

    ```bash
    ./docker/extract-artifacts.sh base:test
    ```

3. Build Core Images

    path : `./`

    ```bash
    ./docker/build-containers.sh core:test local
    ```

    *if you want to make a `api:dhis-2` you can set the `core:test` to `api:dhis-2` and then the final output core images are `api:dhis-2`*

4. Env

    path : `./docker-compose/cluster` 

    edit the `.env` file with tags that result from step no.3 above

    ```
    DHIS2_CORE_IMAGE=core:api:dhis-2
    ```

5. UP all app

    path : `./docker-compose/cluster`

    ```bash
    docker-compose up -d
    ```

# Pushing Docker Image

After building an images, and to distribute the images to other server, need to push the core images to registry repository ( you can create your own registry, or using public dockerhub registry or other)

you can go to dockerhub and register https://hub.docker.com/signup

The Image name format must be followed by the username, i.e., my username are `auzty`, so the custom images should be `auzty/api:dhis-2` and then you can push it using docker command
> docker push auzty/api:dhis-2

If the Image name are build without username, please copy it first using `docker tag` command, and then push it to private dockerhub repo

> docker tag api:dhis-2 auzty/api:dhis-2

(on dockerhub, you will get 1 free private image repository and unlimited public repository)

## HOW TO RUN SPECIFIC CORE Images 

To run the specific core images, just need step 4 and step 5, (make sure the core images are pushed to public docker repository for example https://hub.docker.com/)

## HOW TO STOP 

path : `./docker-compose/cluster`

```
docker-compose stop
```