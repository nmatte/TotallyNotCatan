var React = require('react');
var Row = require('./row.jsx');

module.exports = React.createClass({
  render: function () {
    return (
      <div className="map">
        <Row verticies={7} start="low" rownum="row1"/>
        <Row verticies={9} start="low" rownum="row2"/>
        <Row verticies={11} start="low" rownum="row3"/>
        <Row verticies={11} start="high" rownum="row4"/>
        <Row verticies={9} start="high" rownum="row5"/>
        <Row verticies={7} start="high" rownum="row6"/>

      </div>
    );
  }
});
