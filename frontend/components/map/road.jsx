var React = require('react');

module.exports = React.createClass({
  render: function () {
    if (this.props.height === "low") {
      return <div className="road low"></div>;
    } else if (this.props.height === "high") {
      return <div className="road high"></div>;
    } else {
      return <div className="road vertical"></div>;
    }
  }
});
