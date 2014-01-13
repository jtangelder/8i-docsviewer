###* @jsx React.DOM ###
  
React = require 'react'
MicroEvent = require './libs/microevent.js'

module.exports = 
  events: new MicroEvent()
  
  init: ->
    Base = require './components/Base.coffee'
    React.renderComponent `<div class="docs-viewer"><Base /></div>`, 
      document.getElementById('gdocs-list')