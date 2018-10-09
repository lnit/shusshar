# Shusshar


<a name="overview"></a>
## Overview
勤怠システム操作用API


### Version information
*Version* : 1.0.0


### URI scheme
*Host* : localhost:3000  
*BasePath* : /api/v1  
*Schemes* : HTTP


### Tags

* clarinet : ネットde勤怠の操作




<a name="paths"></a>
## Paths

<a name="clarinet-punch-post"></a>
### 打刻する
```
POST /clarinet/punch
```


#### Description
出退勤状態に応じて自動で出勤/退勤を行う<br/>2回続けて実行すると出勤後に即座に退勤処理が行われるため要注意


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**body**  <br>*required*|ネットde勤怠のログインID/PWをパラメータとする|[Auth](#auth)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Bad Request|[ErrorResponse](#errorresponse)|
|**401**|Unauthorized|[ErrorResponse](#errorresponse)|


#### Consumes

* `application/json`


#### Produces

* `application/json`


#### Tags

* clarinet


<a name="clarinet-shussha-post"></a>
### 出社する
```
POST /clarinet/shussha
```


#### Description
出社できる場合に出社を行う<br/>2回続けて実行した場合エラーとなる


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**body**  <br>*required*|ネットde勤怠のログインID/PWをパラメータとする|[Auth](#auth)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Bad Request|[ErrorResponse](#errorresponse)|
|**401**|Unauthorized|[ErrorResponse](#errorresponse)|


#### Consumes

* `application/json`


#### Produces

* `application/json`


#### Tags

* clarinet


<a name="clarinet-status-post"></a>
### 自身の出退勤状態確認
```
POST /clarinet/status
```


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**body**  <br>*required*|ネットde勤怠のログインID/PWをパラメータとする|[Auth](#auth)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[Response 200](#clarinet-status-post-response-200)|
|**401**|Unauthorized|[ErrorResponse](#errorresponse)|

<a name="clarinet-status-post-response-200"></a>
**Response 200**

|Name|Schema|
|---|---|
|**status**  <br>*optional*|string|


#### Consumes

* `application/json`


#### Produces

* `application/json`


#### Tags

* clarinet


<a name="clarinet-taisha-post"></a>
### 退社する
```
POST /clarinet/taisha
```


#### Description
退社できる場合に退社を行う<br/>2回続けて実行した場合エラーとなる


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**body**  <br>*required*|ネットde勤怠のログインID/PWをパラメータとする|[Auth](#auth)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Bad Request|[ErrorResponse](#errorresponse)|
|**401**|Unauthorized|[ErrorResponse](#errorresponse)|


#### Consumes

* `application/json`


#### Produces

* `application/json`


#### Tags

* clarinet




<a name="definitions"></a>
## Definitions

<a name="auth"></a>
### Auth

|Name|Description|Schema|
|---|---|---|
|**login_id**  <br>*optional*|ネットde勤怠ID|string|
|**login_pass**  <br>*optional*|ネットde勤怠PW|string|


<a name="errorresponse"></a>
### ErrorResponse

|Name|Schema|
|---|---|
|**code**  <br>*optional*|integer (int32)|
|**message**  <br>*optional*|string|
|**type**  <br>*optional*|string|





