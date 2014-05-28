Ruby Riot Game API Wrapper
========

https://developer.riotgames.com/api

Setup API with API Key

```Ruby
RiotAPI::API.setup("abc")
```


Register API strategy

```Ruby
RiotAPI::API.register("summoner")
```
or
```Ruby
RiotAPI::API.register_all
```


Get url

```Ruby
RiotAPI::API.summoner.by_names "lanjj"
```


Request

```Ruby
RiotAPI::API.call("summoner", "find_by_names", "lanjj")
```
or
```Ruby
RiotAPI::API.summoner.find_by_names "lanjj"
```
