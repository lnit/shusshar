# README

* 自動打刻アプリ

# Usage

```
curl -X POST -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/status
curl -X POST -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/punch
curl -X POST -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/shussha
curl -X POST -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/taisha
```

# Getting started

```
$ docker-compose up
$ curl -X POST -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/status
```
