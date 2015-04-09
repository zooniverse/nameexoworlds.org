#= require jquery
#= require bootstrap
#= require_self
#= require react
#= require react_ujs
#= require components


blank = (s)->
  typeof(s) == "undefined" ? true : s.replace( /\ /g, "").length == 0


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
     allowedAfter =[46, 8, 37, 38,39,40]
     allowed =/[0-9A-Za-z\s]/


     charCode =  e.key
     string_length = @value.replace( /\ /g, "").length

     if string_length < 16
       if !charCode.match(allowed)
         e.preventDefault()

     if string_length >= 16
       if allowedAfter.indexOf(e.keyCode) == -1
         e.preventDefault()

  $("#removeSuggestion").click (e)->
    system_id          = $(".systemNameEntry").data().systemId
    $.post "/systems/#{system_id}/remove_club_suggestion", ->
      location.reload()

  $("#saveSubmission").click (e)->
    any_blank = false

    remarks = $("#remarks").val()
    system_name        = $(".systemNameEntry input").val()
    system_description = $(".systemNameEntry textarea").val()
    system_id          = $(".systemNameEntry").data().systemId
    planets={}

    if $(".systemNameEntry input").length > 0
      if blank(system_name) or blank(system_description)
        any_blank = true

    $(".planetNameEntry").each (index, el)->
     planet_id   = $(el).data().planetId;
     name        = $(el).find("input").val()
     description = $(el).find("textarea").val()
     if blank(name) or blank(description)
       any_blank=true
     planets[planet_id] = {name: name, description: description}

    result = {system_name: system_name, system_description: system_description, planets: planets, remarks: remarks}

    if any_blank
      alert("Please make sure you fill out all fields.")
    else
      $.post "/systems/#{system_id}/create_club_suggestion", result, ->
        location.reload()

  # $("#submit_names").click(e)->
