// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//$('a[data-method="delete"]').live('ajax:success', function(){});

$(document).ready(function(){
  $('#tasks').sortable({
    axis: 'y',
    dropOnEmpty: false,
    cursor: 'crosshair',
    items: 'li',
    opacity: 0.4,
    scroll: true,
    forceHelperSize: true,
    update: function(){
      $.ajax({
        type: 'post',
        data: $('#tasks').sortable('serialize'),
        dataType: 'script',
        complete: function(request){
          $('#tasks').effect('highlight');
          },
        url: '/tasks/sort'
      })
    }
  });
});

$(document).ready(function(){
  $('#sortTabs').tabs();
});

$(document).ready(function() {

  var newDate = new Date();

setInterval( function() {
	// Create a newDate() object and extract the seconds of the current time on the visitor's
	var seconds = new Date().getSeconds();
	// Add a leading zero to seconds value
	$("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
	},1000);
	
setInterval( function() {
	// Create a newDate() object and extract the minutes of the current time on the visitor's
	var minutes = new Date().getMinutes();
	// Add a leading zero to the minutes value
	$("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
    },1000);
	
setInterval( function() {
	// Create a newDate() object and extract the hours of the current time on the visitor's
	var hours = new Date().getHours();
	// Add a leading zero to the hours value
	$("#hours").html(( hours < 10 ? "0" : "" ) + hours);
    }, 1000);	
});

