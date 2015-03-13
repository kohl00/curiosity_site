
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

var main = function(){

	$("#comment_body").keyup(function(){
		$("#counter").text(" ");
		var patt1 = /\S+/g;
		var match = $(this).val().match(patt1).length;
		
		$("#counter").text(match);

		if(match > 0 && match <15){
		  $("#counter").text(match + " " + "keep on going!");
		}
	});	

};
$(document).ready(main);