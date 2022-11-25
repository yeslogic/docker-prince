# docker-prince

Dockerfiles for building Docker images with [Prince] installed.

## Using

Images are available with the following tags (multiple tags on the same line
indicate the same image):

* `yeslogic/prince:latest` `yeslogic/prince:15` `yeslogic/prince:15-debian-11-slim`
* `yeslogic/prince:15-debian-10-slim`
* `yeslogic/prince:15-debian-9-slim`
* `yeslogic/prince:15-debian-10`
* `yeslogic/prince:15-debian-11`
* `yeslogic/prince:15-debian-9`

Example:

```shell
docker run --rm -it -v $(pwd):/out yeslogic/prince:15 https://example.com/ -o /out/example.pdf
```

## Building

Build all:

    make

Build a specific image:

    make debian-11

Available targets:

* `debian-9`
* `debian-10`
* `debian-11`
* `debian-9-slim`
* `debian-10-slim`
* `debian-11-slim`

## Publishing

Push images to Docker Hub:

    make dockerhub

Then update the README on Docker Hub.

[Prince]: https://www.princexml.com/
