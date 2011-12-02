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



