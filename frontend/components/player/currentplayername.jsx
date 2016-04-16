var React = require('react');

var PlayerStore = require('../../stores/player.js');

module.exports = React.createClass({
  getInitialState: function(){
    return {currentPlayer: PlayerStore.currentPlayer() };
  },

  render: function () {
    return (
      <div >
        <h1>{this.state.currentPlayer.name}</h1>
      </div>
    );
  }
});
