# docker-prince

Dockerfiles for building Docker images with [Prince] installed.

## Using

Images are available with the following tags (multiple tags on the same line
indicate the same image):

* `yeslogic/prince-13.1` `yeslogic/prince-13.1-debian-10-slim`
* `yeslogic/prince-13.1-debian-9-slim`
* `yeslogic/prince-13.1-debian-8-slim`
* `yeslogic/prince-13.1-debian-10`
* `yeslogic/prince-13.1-debian-9`
* `yeslogic/prince-13.1-debian-8`

## Building

Build all:

    make

Build a specific image:

    make debian-10

Available targets:

* `debian-8`
* `debian-9`
* `debian-10`
* `debian-8-slim`
* `debian-9-slim`
* `debian-10-slim`

[Prince]: https://www.princexml.com/
