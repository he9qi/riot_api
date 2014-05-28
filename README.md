Ruby Riot Game API Wrapper
========

https://developer.riotgames.com/api

Setup API with API Key
`Riot::API.setup("abc")`


Register API strategy
`Riot::API.register("summoner")`


```Ruby

# use call
Riot::API.call("summoner", "find_by_names", "lanjj")

# use summoner directly
Riot::API.summoner.find_by_names "lanjj"

```
