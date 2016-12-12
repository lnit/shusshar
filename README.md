# README

* 自動打刻アプリ

# Usage

```
curl -X GET  -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/status
curl -X POST  -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/dakoku
curl -X POST  -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/shussha
curl -X POST  -H 'Content-Type:application/json' -d '{"login_id" : "#{YOUR_ID}", "login_pass" : "#{YOUR_PASS}"}' http://localhost:3000/api/v1/clarinet/taisha
```

# Getting started

```
$ docker build -t lnit/shusshar:latest https://github.com/lnit/shusshar.git
$ docker run -itd -p 3000:3000 lnit/shusshar:latest
```
