#= require jquery
#= require bootstrap
#= require_self

$ ->
  $(".system_row").click ()->
      window.location = "/systems/#{$(this).data()["systemId"]}"

  $(".remove_vote").click (e)->
      e.preventDefault()
      system_id = $(this).data().systemId;
      $(".updating").show()
      $(".remove_vote").hide()
      $(".add_vote").hide()

      $.post "/systems/#{system_id}/remove_club_vote", (data)->
        $(".add_vote").show()
        $(".vote_count").html(data.new_vote_count)

  $(".add_vote").click (e)->
      e.preventDefault()
      system_id = $(this).data().systemId;
      $(".updating").show()
      $(".remove_vote").hide()
      $(".add_vote").hide()

      $.post "/systems/#{system_id}/add_club_vote", ()->
        $(".remove_vote").show
        $(".vote_count").html(data.new_vote_count)
