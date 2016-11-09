# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'line_item:update', ->
    $.ajax
      url: '/line_items.js'
      method: 'GET'
      dataType: 'html'
      success: (data)->
        $("#line_item_info").html(data)