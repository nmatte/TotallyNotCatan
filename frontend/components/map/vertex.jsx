var React = require('react');

module.exports = React.createClass({
  render: function () {
    if (this.props.height==="low"){
      return (
        <div className="vertex" id="low">

        </div>
      );
    } else {
      return (
        <div className="vertex" id="high"></div>
      );
    }
  }
});
