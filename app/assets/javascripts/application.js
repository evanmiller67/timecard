// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  // Your code here
	// $("#project_allocations").html($("#project_allocations").html() + $("#project_allocations_template").html());   
	$("#projects").append($("#project_template").html());
	$("#allocations").append($("#allocation_template").html());

	
	$("#add").click(function(){
		$("#project_allocations").html($("#project_allocations").html() + $("#project_allocations_template").html());		
	});

	$("select").live('change', function(){
		// $("#project_allocations").append($("#project_allocations_template").html());		
		$("#projects").append($("#project_template").html());
		$("#allocations").append($("#allocation_template").html());
	});
	
});