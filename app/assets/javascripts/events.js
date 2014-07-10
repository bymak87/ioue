$(document).on('ready page:load',function(){
  $('#pay_date').datepicker();

  });

$(document).on('ready page:load',function(){
  $("#myList li").hide();
    $("#myList li").each(function(i, li) {
        var $list = $(this).closest('ul');
        $list.queue(function() {
            $(li).addClass('animated rollIn').show();
            $list.dequeue();
        }).delay(500);
    });
});

