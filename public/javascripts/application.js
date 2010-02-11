$(function(){

  $(".delete a").click(function() {
    $.ajax({
      type: "post",
      url: this.href,
      data: {
        _method: "delete",
        authenticity_token: encodeURIComponent(AUTH_TOKEN)
      }
    });
    $(this).parents("tr").fadeOut();
    $('h2 span').text($('tbody tr').length);
    return false;
  });
  
  $("tr").hover(
    function(){
      $(this).find('td.delete a').show();
    },
    function(){
      $(this).find('td.delete a').hide();
    }
  );
  
  if($('tbody tr').length) {
    $("table#feeds").tablesorter({
      sortList: [[0,0]]
    });
    $("table#alerts").tablesorter({
      sortList: [[3,1]]
    });
  }
  
});