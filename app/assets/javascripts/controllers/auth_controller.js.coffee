
Astronamer.AuthBarController = Ember.ObjectController.extend
  needs  : ["application"]
  user   : Em.computed.alias "controllers.application.model"
  hiName : Em.computed.alias "user.name"
