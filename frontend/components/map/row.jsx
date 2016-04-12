var React = require('react');
var Vertex = require('./vertex.jsx');

module.exports = React.createClass({
  getInitialState: function(){
    return({
      height: this.props.start
    });
  },
  generateVertex: function(){
    var vertArray = [];
    for(var i = 0; i < this.props.verticies; i++){
      vertArray.push(<Vertex height={this.state.height} key={i}/>);
      if (this.state.height === "low"){
        this.state.height = "high";
      } else {
        this.state.height = "low";
      }
    }
    return vertArray;
  },
  render: function () {
    var verticies = this.generateVertex();
    return (
      <div className="row" id={this.props.rownum}>
        {verticies}
      </div>
    );
  }
});
