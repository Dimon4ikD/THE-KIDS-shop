# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready=->
  $("product")

$('.dropdown-toggle').dropdown()





UIkit.notify
  message: "Bazinga!"
  status: "info"
  timeout: 5000
  pos: "top-center"


# Shortcuts
UIkit.notify "My message"
UIkit.notify "My message", status
UIkit.notify "My message", {} # options


#<script type="text/javascript">
#  $(function() {
#    $(".btn").click(function(){
#    $(this).button('loading').delay(3000).queue(function() {
#    $(this).button('reset');
#$(this).dequeue();
#});
#});
#});
#</script>
#<button type="button" class="btn btn-default" data-loading-text="Загрузка...">Default</button>
#<button type="button" class="btn btn-primary" data-loading-text="Загрузка...">Primary</button>
#<button type="button" class="btn btn-info" data-loading-text="Загрузка...">Info</button>
#<button type="button" class="btn btn-success" data-loading-text="Загрузка...">Success</button>
#<button type="button" class="btn btn-warning" data-loading-text="Загрузка...">Warning</button>
#<button type="button" class="btn btn-danger" data-loading-text="Загрузка...">Danger</button>
#<button type="button" class="btn btn-link" data-loading-text="Загрузка...">Link</button>
#      Default