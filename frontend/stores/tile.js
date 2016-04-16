var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/dispatcher.js');

var TileStore = new Store(AppDispatcher);

var _tiles = [];
// create a tile object
function Tile(type, diceValue){ //TODO add the vertex array for connections
  this.type = type;
  this.conections = [];
  this.diceValue = diceValue;
}

var generateNewMap = function(){
  var types = ["plasma","plasma", "plasma",
               "plat", "plat", "plat", "plat",
               "oxy", "oxy", "oxy", "oxy",
               "water", "water", "water","water",
               "food", "food", "food", "food"];
  var values = [6,5,9,4,3,8,10,6,5,null,9,12,3,2,10,11,11,4,8];
  // 4 of each tile with a sun in the middle (except plasma gets 3)
  //  3 plasma (brick)
  //  plat (stone)
  //  Oxygen (wheat)
  //  water (wood)
  //  food? (wheat)
  var i = 0;
  while (types.length > 0){
    var random = Math.floor(Math.random() * types.length);
    _tiles.push(new Tile(types[random], values[i]) );
    types.splice(random, 1);
    i++;
  }
  _tiles[9] = new Tile("sun");
};

TileStore.all = function(){
  return _tiles;
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
