# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'cart:update', ->
    $.ajax
      url: '/carts.js'
      method: 'GET'
      dataType: 'html'
      success: (data)->
        $("#cart_info").html(data)
