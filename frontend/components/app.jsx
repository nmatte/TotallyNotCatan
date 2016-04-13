var React = require('react');
var CatanMap = require('./map/map.jsx');
var MapActions = require('../actions/map.js');

module.exports = React.createClass({
  render: function () {
    MapActions.generateNewMap();
    return(
      <div>
        <CatanMap/>
        <div className="rotate"></div>
      </div>

    );
  }
});
