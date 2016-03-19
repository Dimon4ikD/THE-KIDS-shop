# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




#alert('qq')
ready = ->
#  alert('qq1')
  if $("#editor").length>0
#    alert('qq2')
    editor = ace.edit("editor")
#    alert('qq3')
#    editor.setTheme("ace/theme/pastel_on_dark")
    editor.setTheme("ace/theme/idle_fingers")
#    alert('qq4')
    editor.getSession().setMode("ace/mode/html")
    alert('qq5')


$(document).ready ready
$(document).on 'page:load', ready



#aceonf = (id) ->
#  alert('qq')
#  alert('qq10')
#  editor = ace.edit("editor")
#  alert('qq1')
#  editor.setTheme("ace/theme/textmate")
#  alert('qq3')
#  editor.getSession().setMode("ace/mode/sql")
#  alert('qq5')
#
#
#$(document).ready aceonf('editor')
#$(document).on "ready page:load", aceonf('editor')
#
#


#textarea =
#
#  var textarea = $('textarea[name="description"]').hide();
#editor.getSession().setValue(textarea.val());
#editor.getSession().on('change', function(){
#  textarea.val(editor.getSession().getValue());
#});








#  var editor = ace.edit("editor");
#  editor.setTheme("ace/theme/monokai");
#  editor.getSession().setMode("ace/mode/javascript");



#    lang: 'html'