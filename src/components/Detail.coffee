###* @jsx React.DOM ###
  
React = require 'react'
App = require '../App.coffee'

module.exports = React.createClass
  componentDidMount: ->
    App.events.bind "selectItem", (item)=>
      @setState item: item

  getInitialState: ->
    item: @props.item || false

  render: ->
    renderLink = (label, link, prefix='')->
      if link
        [ `<dt>{label}</dt>`,
          `<dd class="truncate"><a href={prefix+link} target={"_blank"}>{link}</a></dd>`]
    
    if this.state.item
      `<div>
        <h3>{this.state.item.city}, {this.state.item.country}</h3>
        <dl>
          <dt>Name</dt><dd>{this.state.item.name || "-"}</dd>
          {renderLink('Email', this.state.item.email, "mailto:")}
          {renderLink('Website', this.state.item.website)}
          {renderLink('Facebook', this.state.item.facebook)}
          {renderLink('Twitter', this.state.item.twitter, "http://www.twitter.com/")}
          <dt>Year</dt><dd>{this.state.item.year || "-"}</dd>
        </dl>
        <p>{this.state.item.body}</p>
      </div>`
      
    else 
      `<div>Select a city to show it's details.</div>`