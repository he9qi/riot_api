Ruby Riot Game API Wrapper
========

https://developer.riotgames.com/api

[![Code Climate](https://codeclimate.com/github/he9qi/riot_api.png)](https://codeclimate.com/github/he9qi/riot_api)
[![Code Climate](https://codeclimate.com/github/he9qi/riot_api/coverage.png)](https://codeclimate.com/github/he9qi/riot_api)

### install gem
```
gem install 'riot_api_ruby'

or using bundler:
gem 'riot_api_ruby'
```


#### Setup API with API Key

```Ruby
RiotAPI::API.setup("abc")
```


#### Register API strategy

```Ruby
RiotAPI::API.register("summoner")
```
or
```Ruby
RiotAPI::API.register_all
```


#### Get API url

```Ruby
RiotAPI::API.summoner.by_names "lanjj"
```


#### Request API

```Ruby
RiotAPI::API.call("summoner", "find_by_names", "lanjj")
```
or
```Ruby
RiotAPI::API.summoner.find_by_names "lanjj"
```
