[![Build Status](https://travis-ci.org/garethflowers/docker-svn-server.svg?branch=master)](https://travis-ci.org/garethflowers/docker-svn-server) [![Image Layers](https://images.microbadger.com/badges/image/garethflowers/svn-server.svg)](https://microbadger.com/images/garethflowers/svn-server) [![Docker Pulls](https://img.shields.io/docker/pulls/garethflowers/svn-server.svg)](https://store.docker.com/community/images/garethflowers/svn-server)

# SVN Server

A simple Subversion server, using `svnserve`.

## How to use this image

### Start a Subversion Server instance

To start a container, with data stored in `/home/svn` on the host, use the following:
```sh
docker run \
	--name my-svn-server \
	--detach \
	--volume /home/svn:/var/opt/svn \
	--publish 3690:3690 \
	drivve/svn-server
```

### Creating a new SVN Repository

Use `svnadmin` within your container to create and manage repositories.

For example, to create a repository called `new-repo` in container `my-svn-server`, use the following:
```sh
docker exec -it my-svn-server svnadmin create new-repo
```

## License

*	Apache Subversion is released under the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).
*	This image is released under the [MIT License](https://raw.githubusercontent.com/thrichter/docker-svn-server/master/LICENSE).
