# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###
comment
###

score = 80;
###
if score > 79
	alert "score is bigger than 79."
###
b = [
	1
	3
	5
]
$ ->
    $('p').css('color', 'red')
###
alert b[1..]
###
m = 
	name : "taguchi"
	score: 80

hello = ->
	alert "hello"


class User
	constructor: (name) ->
		@button = document.getElementById 'ptag'
		this.name = name

tom = new User "Tom"
###
alert tom.name
###




