###* @jsx React.DOM ###
  
React = require 'react'
App = require '../App.coffee'
_ = require 'underscore'

module.exports = React.createClass
  groupItems: (items)->
    ###
      Only with a year as the default filter.
  
      It looks through each value in the list, returning an array of all the 
      values that pass a truth test (iterator).
  
      A custom filter method can be used by setting window.DOCS_FILTER. 
      Example to show only dutch items:
        window.DOCS_FILTER = function(item) {
          return item.country.toLowerCase() == 'the netherlands';
        };
    ###
    items = _.filter items, window.DOCS_FILTER or ((item)-> item.year)
    
    # order by city and group by country
    items = _.sortBy items, (item)-> item.city
    _.groupBy items, (item)-> item.country

  getInitialState: ->
    items: @groupItems(@props.items || [])

  selectItem: (item)->
    @setState selectedRow: item.rowNumber
    App.events.trigger "selectItem", item
    return false
    
  render: ->    
    self = this
    
    createCityList = (item)->
      className = ''
      if item.rowNumber is self.state?.selectedRow
        className = 'selected'

      `<li key={item.rowNumber} class={className}>
        <a href="#doc-detail" onClick={_.bind(self.selectItem, self, item)}>
          {item.city}
        </a>
      </li>`
    
    createCountryList = (cities, country)->
      `<li key={country}>
        <strong>{country}</strong>
        <ul>{_.map(cities, createCityList)}</ul>
      </li>`
    
    `<ul class="city-list">{_.map(this.state.items, createCountryList)}</ul>`