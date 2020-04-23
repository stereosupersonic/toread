# README

[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

## development setup

### setup 

```
 bin/rails db:setup
```

### start 

``` 
  bin/webpack-dev-server
  bin/server

```


## process all emails

```
bin/rake toread:mails:process
```

## docker

### docker-compose

```
 docker-compose build
```

```
  docker-compose up
  // or with recreare
  docker-compose up --build --force-recreate
```

## production deploy

### checkout source

```
git clone git@github.com:stereosupersonic/toread.git
```

### .env 

create a new file .env

add add RAILS_MASTER_KEY=XXX  

### build image

```
cd toread
docker-compose -f docker-compose.traefik.yml build
```


### run image

```
docker-compose -f docker-compose.traefik.yml up -d
```
