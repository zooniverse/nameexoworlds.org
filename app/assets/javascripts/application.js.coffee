#= require jquery
#= require bootstrap
#= require_self
#= require react
#= require react_ujs
#= require components




$ ->

  $.ajaxSetup
    headers:
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')

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
        $(".updating").hide()
        new_count = $("selection_count").html().to_i + 1
        $("selection_count").html(new_count)

  $("#create_selection").click (e)->
      e.preventDefault()
      system_id = $(this).data().systemId;
      $(".updating").show()
      $(".remove_vote").hide()
      $(".add_vote").hide()

      $.post "/systems/#{system_id}/add_club_vote", (data)->
        $(".remove_vote").show()
        $(".updating").hide()
        new_count = $("selection_count").html().to_i - 1
        $("selection_count").html(new_count)

  $(".limit_text").keypress (e)->
     allowed =[46, 8]
     charCode =  e.keyCode
     e.preventDefault() if @value.replace(" ", "").length >= 16 and allowed.indexOf(charCode) != -1

  $("#removeSuggestion").click (e)->
    system_id          = $(".systemNameEntry").data().systemId
    $.post "/systems/#{system_id}/remove_club_suggestion", ->
      location.reload()

  $("#saveSubmission").click (e)->
    remarks = $("#remarks").val()
    system_name        = $(".systemNameEntry input").val()
    system_description = $(".systemNameEntry textarea").val()
    system_id          = $(".systemNameEntry").data().systemId
    planets={}

    $(".planetNameEntry").each (index, el)->
     planet_id   = $(el).data().planetId;
     name        = $(el).find("input").val()
     description = $(el).find("textarea").val()
     planets[planet_id] = {name: name, description: description}
    result = {system_name: system_name, system_description: system_description, planets: planets, remarks: remarks}

    $.post "/systems/#{system_id}/create_club_suggestion", result, ->
      location.reload()

  # $("#submit_names").click(e)->
