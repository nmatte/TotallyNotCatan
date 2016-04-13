var React = require('react');

module.exports = React.createClass({
  render: function () {
    if (this.props.tile.type === "sun"){
      return <div className="tile" id={this.props.tile.type}>
              <img src="http://clipartwiz.com/wp-content/uploads/2016/02/Sun-clipart-free-clip-art-images-2.png"/>
             </div>;
    }
    return (
      <div className="tile" id={this.props.tile.type}>

      </div>
    );
  }
});
