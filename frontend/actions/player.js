var AppDispatcher = require('../dispatcher/dispatcher');

var PlayerActions = {
  generateNewPlayers: function(players){
    AppDispatcher.dispatch({
      actionType: "NEW_PLAYERS",
      players: players
    });
  }
};


module.exports = PlayerActions;
