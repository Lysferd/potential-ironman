# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

delay = (ms, func) -> setTimeout func, ms
popup = (msg) -> $( '.tooltip' ).show

$ ->
  delay 2500, -> $( '#alert, #notice' ).fadeOut 'slow'
  $( 'input[data-popbox]' ).hover -> $( '#pop1.tooltip' ).show

  #.effect 'slide', { "direction" : 'up', 'mode' : 'hide' }
  #$( '.button' ).click ->
    #$( '#login' ).slideUp( 'slow' )
