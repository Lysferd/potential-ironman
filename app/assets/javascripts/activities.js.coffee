# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $( '#activity_date_start, #activity_date_end' ).datepicker()
  $( '#activity_date_start, #activity_date_end' ).datepicker( "option", "dateFormat", "dd/mm/yy" )
  $( '#activity_date_start, #activity_date_end' ).datepicker( "option", "showAnim", "fold" )