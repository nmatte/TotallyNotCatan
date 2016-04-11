
var React = require('react');
var ReactDOM = require('react-dom');

var Router = require('react-router').Router;
var Route = require('react-router').Route;
var IndexRoute = require('react-router').IndexRoute;


// var routes = (
//   <Route path="/" component={App}>
//     <Route path="pokemon/:pokemonId" component={PokemonDetail}>
//       <Route path="toys/:toyId" component={ToyDetail} />
//     </Route>
//   </Route>
// );

document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(
    <div>react is working</div>,
    document.getElementById('root')
  );
});
