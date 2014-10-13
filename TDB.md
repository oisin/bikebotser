 * add persistent storage
 * change from env-driven to db-driven configuration, with admin panel
 * add faves and scrub faves
 * deploy to heroku button compatible
 * add commutes and scrub commutes

----

On start up and regularly thereafter, pull the static data about the
stations from the JCD site and deploy the new pieces. Make this
accessible from the Admin site - reload scheme data, reload station data.

Bike scheme can be set per channel, and can be set in the channel, with
the `bike scheme <name>` command. Check what scheme you are using with
`bike scheme` and what the possible schemes are with `bike schemes`.

People have favourites per scheme, and then this maps to per channel.
To apply/get a fave, get the current scheme for the channel and use that
as the basis for the fave lookup. Same goes for commutes.

**Data**

defaults -> scheme / slack tokens / jc decaux token

channel -> scheme
scheme -> contract
scheme -> stations
station -> station_data

fave -> scheme / station
commute -> scheme/station + scheme/station

**on startup**

* press the deploy button, it starts
* go direct to admin and and set a password
* set up all the defaults (until these are set up there will be a message on all
  interactions saying that it needs to be initialized)

Neat login form:  http://vinceg.github.io/Bootstrap-Admin-Theme-3/login.html

Use standard password style login to admin - github etc overkill and not sharable.
Need some way to recover the password. Ugh that always means email.

First step - enter JC Decaux code - that is the login :D
Then go get all the static data
Then present the form
  - default contract/scheme
  - name of the bot
  - slack in/out tokens  
