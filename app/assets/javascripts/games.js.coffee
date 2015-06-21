# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@GamePoller =
  poll: ->
    setTimeout @request, 1000

  request: ->
    $.get($('#game_path').data('url'))

jQuery ->
  $('#game_list').DataTable({});

  $(document).on "page:change", ->
    GamePoller.poll()