#= require jquery
#= require bootstrap
#= require_self

$ ->
  $(".system_row").click ()->
      window.location = "/systems/#{$(this).data()["systemId"]}"

  $(".remove_vote").click (e)->
      e.preventDefault()
      system_id = $(this).data().systemId;
      $.post "/systems/#{system_id}/remove_club_vote", ()->
        $(".remove_vote").css("display","none")
        $(".add_vote").css("display","inline")

  $(".add_vote").click (e)->
      e.preventDefault()
      system_id = $(this).data().systemId;
      $.post "/systems/#{system_id}/add_club_vote", ()->
        $(".remove_vote").css("display","inline")
        $(".add_vote").css("display","none")
