
|Public Health Warning|
|:-:|
|This is a work in progress, it's not even doing what it is meant to yet!
|**DO NOT USE**

### A little bot for checking bike availability with Slack

Bikebotser needs to know your local bike scheme, and your Slack access tokens, and your JC Decaux developer tokens.
Yes, you'll need all of those things to make it work :)

**Environment**

var|default|wat
:--|:-:|:--
SLACK_TEAM | *nil* | your team name
SLACK_CHANNEL | *#default* | slack channel to inhabit
SLACK_TOKEN_IN | *nil* | slack token for incoming messages
SLACK_TOKEN_OUT | *nil* | slack token for outgoing messages
DECAUX_TOKEN | *nil* | access token for JC Decaux developer site
BIKEBOTSER_NAME | *bikebotser* | name that the bot will use in your channel
BIKEBOTSER_SCHEME | *Dublin* | the Decaux 'contract' that you are using


    free <station>

Tell me how many bikes are available at a station.

    fave <station> <name>

Add a favourite station, then you can use any of the commands that take a station number or
name without any argument and it will use your faves.

    slots <station>

Tell me how many bike slots are available at the station

    commute <station number> <station number> <name>

    commute <name>

Set up a commute from a station to another station, and give it a name. When you mention a commute,
it will show you what bikes are available at the first station and what slots are available at
the goal station. You can make multiple commutes with the same name, this is how you would construct
alternative start and finish stations.

    scrub <fave | commute> <name>

Get rid of faves or commutes you made earlier.

    commutes

    faves

Show your faves and your commutes.

    help
    wat
    wtf

Show a summary of what you can do with the bikebotser.

###Getting your tokens

You'll need Slack and JC Decaux tokens. Instructions for getting them are on the sites.

###Deploying

You need to host this bot somewhere, and it's up to you how you want to do that. Heroku is an
easy option, as is Engine Yard, AppFog. Digital Ocean, Linode and EC2 are also good. Or you can
host it on an in-house server, once it can receive webhook calls from Slack.

### Attributions

Bicycle logo designed by [Shahed Syed](http://www.thenounproject.com/dehahs) from
the [Noun Project](http://www.thenounproject.com)
