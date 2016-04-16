var React = require('react');
var CatanMap = require('./map/map.jsx');
var MapActions = require('../actions/map.js');
var PickPlayer = require('./player/pickplayer.jsx');

module.exports = React.createClass({
  render: function () {
    return(
      <div>
        <PickPlayer/>
      </div>

    );
  }
});
