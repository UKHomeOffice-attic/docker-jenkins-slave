# Jenkins Slave Docker Container

[![Build Status](https://travis-ci.org/UKHomeOffice/docker-jenkins-slave.svg?branch=master)](https://travis-ci.org/UKHomeOffice/docker-jenkins-slave)

This container is a basic jenkins slave that contains only the information required to get a jenkins
node up an running. The reason behind this image is to give you somewhere to put language specific 
build tools and dependencies (which may even conflict with differing library version, for example) 
without having an overly complicated jenkins master.

## Getting Started

In this section I'll show you some examples of how you might run this container with docker.

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

You'll also need a jenkins master with a node configured on it, that doesn't already have a slave 
connected to it.

There is a guide [on the jenkins wiki on how to do that][1] on how to do that. You'll only need to 
go up to step 4 though.

The Remote FS Root you want will be `/home/jenkins`

## Usage

### Container Parameters

This container has two modes of operation, the first is jenkins slave mode.

In this mode you pass the container 3 parameters.

* `jenkins-slave` - To tell the container to run as a jenkins slave
* `http://jenkins-url:5321` - Jenkins URL
* `my-node` - The name you've given the node

This looks look a bit like this in docker

```shell
docker run quay.io/ukhomeofficedigital/jenkins-slave:v0.1.0 \
           jenkins-slave \
           http://jenkins-url:5321 \
           my-node
```

The other mode of operation is simply to drop you into a bash shell on the container. For this just
run the command you want to execute as a parameter as normal. 

So if you wanted to run bash, you'd run this 

```shell
docker run quay.io/ukhomeofficedigital/jenkins-slave:v0.1.0 \
           bash
```

### Volumes

* `/home/jenkins` - The default location where jenkins things happen.
  
### Kubernetes Example

You can find an example of the ReplicationController you might with this container in 
[examplekb8.rc.yml](examplekb8.rc.yml).
  
## Find Us

* [GitHub](https://github.com/UKHomeOffice/docker-jenkins-slave)
* [Quay.io](https://quay.io/repository/ukhomeofficedigital/jenkins-slave)

## Contributing

Feel free to submit pull requests and issues. If it's a particularly large PR, you may wish to 
discuss it in an issue first.

Please note that this project is released with a [Contributor Code of Conduct](code_of_conduct.md). 
By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the
[tags on this repository](https://github.com/UKHomeOffice/docker-jenkins-slave/tags).

## Authors

* **Billie Thompson** - *Initial work* - [purplebooth](https://github.com/purplebooth)

See also the list of 
[contributors](https://github.com/UKHomeOffice/docker-jenkins-slave/graphs/contributors) who 
participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

[1]: https://wiki.jenkins-ci.org/display/JENKINS/Step+by+step+guide+to+set+up+master+and+slave+machines "Step by step guide to set up master and slave machines"
