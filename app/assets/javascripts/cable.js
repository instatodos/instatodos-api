 //= require action_cable
 //= require_self
 //= require_tree ./channels

 const App = {}
 App.cable = ActionCable.createConsumer()
