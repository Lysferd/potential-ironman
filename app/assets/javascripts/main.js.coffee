# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

delay = (ms, func) -> setTimeout func, ms
popup = (msg) -> $( '.tooltip' ).show()

redirect = (page) ->
  speed = 'fast'
  $( 'div#contents' ).fadeOut speed, ->
    $( 'div#contents' ).html page
    $( 'div#contents' ).fadeIn speed

$ ->
  $( document ).on 'ajax:before ajaxStart page:fetch', ->
    $( 'div#spinner' ).fadeIn 'fast'

  $( document ).on 'ajax:complete ajaxComplete page:change', ( event, xhr ) ->
    $( 'div#spinner' ).fadeOut 'fast'
    flash = $.parseJSON( xhr.getResponseHeader( 'X-Flash-Messages' ) )
    return if _.isEmpty flash

    _.each flash, (message, type) ->
      decoded_message = decodeURIComponent( message )
      if type == 'title' then $( 'div#title' ).html decoded_message
      if type == 'notice' or type == 'alert'
        $( 'div#title' ).after "<div id='#{type}'>#{decoded_message}</div>"
        delay 2500, -> $( 'div#notice, div#alert' ).fadeOut 'slow'
      
  #$( 'input[data-popbox]' ).hover -> $( '#pop1.tooltip' ).show()

root = exports ? this
root.redirect = redirect
