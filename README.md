#NFL Draft Tracker

This app allows the NFL to perform their draft selection.  A user is allowed to see the draft happening live as well as the results of the draft.  A list of players that are undrafted is also provided.

##Installation

```
git clone https://github.com/ChrisBarthol/draft_tracker.git
bundle install #install dependencies
rake draft:populate #populate the database
```

##Draft Simulation
A rake task to perform the draft simulation is also provided.

```
rake draft:dodraft
```

The rake tasks assumes that the database as been populated as instructed in the installation.  It also assumes that the server is _already running_ on port 3000 of the local machine.


