Astronamer.IndexRoute = Ember.Route.extend

  setUpController:->

  model :->
    # $.getJSON "/unnamed_planets"
    [
      {name: "23424324",
      suggested_names: [{name: "bobby", votes: 10},{name: "bobby", votes: 6}, {name: "bobby", votes: 2}],
      total_votes: 10,
      total_names: 2
      },
      {name: "65363",
      suggested_names: [{name: "jenny", votes: 10},{name: "rad", votes: 6}, {name: "brad", votes: 2},{name: "james", votes: 2}],
      total_votes: 11,
      total_names: 11
      }
    ]
