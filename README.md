# DaCapo benchmarks development container
## Setup
```bash
git clone https://github.com/dacapobench/dacapobench
cd dacapobench/benchmarks
cp default.properties local.properties
sed -i s/java-1.11.0-openjdk-amd64/temurin-11-jdk-amd64/ local.properties
cd ..
docker run -it --rm -v $PWD:/dacapobench -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group  -u $(id -u $USER):$(id -g $USER) ghcr.io/caizixian/dacapo-docker:master bash
cd dacapobench/benchmarks
ant # build all benchmarks
```
