###* @jsx React.DOM ###
  
React = require 'react'
_ = require 'underscore'

App = require '../App.coffee'
Tabletop = require '../libs/tabletop.js'

List = require './List.coffee'
Detail = require './Detail.coffee'

module.exports = React.createClass
  componentDidMount: ->    
    Tabletop.init
      key: '0AnYBacpKKuobdGU1cGRTYmdDdjJoSHBfc0poVzRuT1E'
      simpleSheet: true
      callback: (data, tabletop)=>
        if data          
          # normalize data
          map_columns =
            andyouremailaddress: "email"
            anyotherremarks: "remarks"
            approvedforthisyear: "year"
            howdidyoufindoutabouttheproject: "referer"
            inwhatcitywouldyouliketoorganize8i: "city"
            inwhatcountryisthat: "country"
            whatsyourname: "name"

          _.map data, (row)->            
            for own key, val of row
              if key of map_columns
                row[map_columns[key]] = val
                delete row[key]
                
          @setState(items: data)

  render: ->  
    if @state?.items
      `<div class="row sqs-row">
          <div class="col sqs-col-4 span-4"><List items={this.state.items} /></div>
          <div class="col sqs-col-8 span-8" id="doc-detail"><Detail /></div>
        </div>`      
    else 
      `<div>Loading cities...</div>`