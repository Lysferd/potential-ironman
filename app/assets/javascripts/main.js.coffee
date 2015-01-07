# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

delay = (ms, func) -> setTimeout func, ms
popup = (msg) -> $( '.tooltip' ).show

redirect = (page) ->
  animation_speed = 'fast'
  $( 'div#contents' ).fadeOut animation_speed, ->
    $( 'div#contents' ).html page
    $( 'div#contents' ).fadeIn animation_speed

$ ->
  delay 2500, -> $( '#alert, #notice' ).fadeOut 'slow'
  $( 'input[data-popbox]' ).hover ->
    $( '#pop1.tooltip' ).show
  #$( 'a[data-remote]' ).on 'ajax:success', (e,d,s,x) ->
  #alert "Ajax"

root = exports ? this
root.redirect = redirect
