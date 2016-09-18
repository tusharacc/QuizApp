# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@notify = () ->
   alert("I am in")
   elem_list = $('input').get()
   

@displayQuestions = (value) ->
  
  $.ajax({
  	url: "/questions_controller/show_question"
  	data:{question_type: value}
  })
    
$ ->
  $(".title").click (e) ->
    
    displayQuestions(e.target.innerHTML)

$ ->
  $("button").click (e) ->
    notify()  



        
