//= require jquery
//= require jquery-ui
//= require jquery_ujs
// require jquery.ui.all
// require jquery.ui.tabs
$(function(){
  $('#tasks-sorting').sortable({ //wrong id for experiment
    axis: 'y',
    dropOnEmpty: false,
    items: 'li',
    handle: '.handle',
    opacity: 0.4,
    scroll: true,
    update: function(){
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});
$(function(){
  $('checked').click(function(){
    alert('this');
  });
});

$(function() {
  $( "#tasks-tabs" ).tabs();
});

$(function(){
  $('#sortTabs').tabs();
});
$(function(){
  $('#color-legend h3, #color-legend ul').hover(function(){
    $('#color-legend ul').css('display', 'block');
    $('#color-legend ul').css('height', '50px');
  },
  function(){
    $('#color-legend ul').css('display', 'none');
  });
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
/*
$(function(){
  $('#tasks-sorting').sortable();
});
$(function(){
  $('#tasks-sorting').sortable({ //wrong id for experiment
    axis: 'y',
    dropOnEmpty: false,
    items: 'li',
    handle: '.handle',
    opacity: 0.4,
    scroll: true,
    update: function(){
      $.ajax({
        type: 'post',
        data: $('#tasks-sorting').sortable('serialize'),
        dataType: 'script',
        complete: function(request){
          $('#tasks-sorting').effect('highlight');
          },
        url: '/tasks/sort'
      })
    }
  });
});


      $.ajax({
        type: 'post',
        data: $('#tasks-sorting').sortable('serialize'),
        dataType: 'script',
        complete: function(request){
          $('#tasks-sorting').effect('highlight');
          },
        url: '/tasks/sort'
      })
*/

