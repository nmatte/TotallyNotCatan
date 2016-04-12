var React = require('react');
var Tile = require('./tile');
var Road = require('./road');

module.exports = React.createClass({
  generateTiles: function(){
    // we can have a tiles per row store which keeps track of where all the tiles are (store it on the backend too)
    var tiles = [];
    for (var i = 0; i <this.props.tiles; i++){
      tiles.push(<Road/>);
      tiles.push(<Tile key={i} tiletype="water"/>);
    }
    tiles.push(<Road/>);
    return tiles;
  },
  render: function () {
    var display = this.generateTiles();
    return (
      <div className={this.props.rownum}>
        {display}
      </div>
    );
  }
});
