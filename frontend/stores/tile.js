var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/dispatcher.js');

var TileStore = new Store(AppDispatcher);

var _tiles = [];
// create a tile object
function Tile(type){ //TODO add the vertex array for connections
  this.type = type;
  this.conections = [];
}

var generateNewMap = function(){
  var types = ["plasma", "plasma", "plasma",
               "plat", "plat", "plat", "plat",
               "Oxy", "Oxy", "Oxy", "Oxy",
               "water", "water", "water", "water",
               "food", "food", "food", "food"];
  // 4 of each tile with a sun in the middle (except plasma gets 3)
  //  3 plasma (brick)
  //  plat (stone)
  //  Oxygen (wheat)
  //  water (wood)
  //  food? (wheat)
  while (types.length > 0){
    var random = Math.floor(Math.random() * types.length);
    _tiles.push(new Tile(types[random]));
    types.splice(random, 1);
  }
  console.log(_tiles);
};

TileStore.__onDispatch = function(payload){
  switch (payload.actionType) {
    case "NEW_MAP":
      generateNewMap();
      TileStore.__emitChange();
      break;

  }
};
module.exports = TileStore;
