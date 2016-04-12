var React = require('react');
var VertexRow = require('./row.jsx');
var TileRow = require('./tile_row.jsx');

module.exports = React.createClass({
  render: function () {
    return (
      <div className="map">
        <VertexRow verticies={7} start="low" rownum="row1"/>
        <VertexRow verticies={9} start="low" rownum="row2"/>
        <VertexRow verticies={11} start="low" rownum="row3"/>
        <VertexRow verticies={11} start="high" rownum="row4"/>
        <VertexRow verticies={9} start="high" rownum="row5"/>
        <VertexRow verticies={7} start="high" rownum="row6"/>
        <TileRow tiles={3} rownum="tilerow1"/>
        <TileRow tiles={4} rownum="tilerow2"/>
        <TileRow tiles={5} rownum="tilerow3"/>
        <TileRow tiles={4} rownum="tilerow4"/>
        <TileRow tiles={3} rownum="tilerow5"/>
      </div>
    );
  }
});
