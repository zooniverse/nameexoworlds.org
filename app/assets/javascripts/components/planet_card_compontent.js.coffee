Astronamer.PlanetCardComponent = Ember.Component.extend
  expanded: false
  actions:
    expand:->
      @toggleProperty "expanded"
