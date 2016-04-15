var React = require('react');
var LinkedStateMixin = require('react-addons-linked-state-mixin');
var PlayerStore = require('../../stores/player.js');
var PlayerActions = require('../../actions/player.js');


module.exports = React.createClass({
  mixins: [LinkedStateMixin],
  getInitialState: function(){
    return ({
      numberOfPlayers: 0,
      colors: ["red","green","blue","yellow"]
    });
  },
  threePlayers: function(e){
    e.preventDefault();
    this.setState({
      numberOfPlayers : 3,
      player1: "red",
      player2: "green",
      player3: "blue",
    });
  },
  fourPlayers: function(e){
    e.preventDefault();
    this.setState({
      numberOfPlayers : 4,
      player1: "red",
      player2: "green",
      player3: "blue",
      player4: "yellow"
    });
  },
  createPlayers: function(e){
    e.preventDefault();
    var players = [{name: this.state.player1, color: "red"},
                   {name: this.state.player2, color: "green"},
                   {name: this.state.player3, color: "blue"}];
    if (this.state.player4){
      players.push({name: this.state.player4, color: "yellow"});
    }
    PlayerActions.generateNewPlayers(players);
  },
  render: function () {
    if (this.state.numberOfPlayers){
      var display = [];
      for (var i = 0; i < this.state.numberOfPlayers; i++){
        var playerNum = 'player'+(i + 1);
        display.push(
          <div>
            Player Name:
            <input type="text" valueLink={this.linkState(playerNum)} />
            {this.state.colors[i]}
          </div>
        );
      }
      display.push(<input className="start button" type="submit" value="create players"/>);
    }
    return (
      <div>
        <div className="choose-local-players">
          <input className="button" type="submit" value="3 players" onClick={this.threePlayers}></input>
          <input className="button" type="submit" value="4 players" onClick={this.fourPlayers}></input>
        </div>
        <form className="playerinfo" onSubmit={this.createPlayers}>
          {display}
        </form>
      </div>
    );
  }
});
