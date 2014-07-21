#### docker-bugzilla

Configure a running Bugzilla system using Docker

##### Features:

* Running latest Fedora (20)
* Preconfigured with initial data and test product
* Running Apache2 and MySQL Community Server 5.6
* Openssh server so you can ssh in to the system to make changes
* Code resides in `/home/bugzilla/devel/htdocs/bugzilla` and can be updated using standard git commands

##### How to build

If you need to build the base image for yourself,  just change to the directory containing the checked out
files and run the below command:

```bash
$ docker build -rm -t <my_name>/docker-bugzilla .
```

The `-rm` switch removes any interim containers automatically while the image is being created.

##### How to start

```bash
$ docker run -d -t \
    --name bugzilla \
    --hostname bugzilla \
    --publish 8080:80 \
    --publish 2222:22 \
    dklawren/docker-bugzilla
```

This will pull down the docker image from the Docker Registry and start it for you

To stop and remove the container, you can do:

```bash
$ docker stop bugzilla
$ docker rm bugzilla
```

You can point your browser to `http://localhost:8080/bugzilla` to see the the Bugzilla home page.
You can ssh into the container using `ssh bugzilla@localhost -p2222`. The password is `bugzilla`.
The above command that starts the container is also in the `bugzilla_start.sh` file. Once the image
is cache locally, starting the container should happen very quickly. You can run multiple containers
but you will need to give each one a different name/hostname as well as non-conflicting ports numbers
for ssh and httpd.




