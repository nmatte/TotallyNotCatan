var AppDispatcher = require('../dispatcher/dispatcher');

var MapActions = {
  generateNewMap: function(){
    AppDispatcher.dispatch({
      actionType: "NEW_MAP"
    });
  }
};


module.exports = MapActions;
window.MapActions = MapActions;
