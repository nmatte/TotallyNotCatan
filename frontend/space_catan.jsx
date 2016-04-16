
var React = require('react');
var ReactDOM = require('react-dom');

var Router = require('react-router').Router;
var Route = require('react-router').Route;
var IndexRoute = require('react-router').IndexRoute;

var App = require('./components/app.jsx');
var MapActions = require('./actions/map.js');

var TileStore = require('./stores/tile.js');

var CatanMap = require('./components/map/map.jsx');




var routes = (
  <Router>
    <Route path="/" component={App}> </Route>
    <Route path="/map" component={CatanMap}> </Route>
  </Router>
);

document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(
    routes,
    document.getElementById('root')
  );
});
