$(function(){

  records = $("tbody tr").length;

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
    records--;
    $('h2 span').text(records);
    return false;
  });
  
  $("tr").hover(
    function(){
      $(this).find("td.delete a").show();
    },
    function(){
      $(this).find("td.delete a").hide();
    }
  );
  $("tr td.delete a img").hover(
    function(){
      $(this).attr({src:'/images/trash_can_selected.gif'});
    },
    function(){
      $(this).attr({src:'/images/trash_can.gif'});
    }
  );
  
  if(records) {
    $("table#feeds").tablesorter({
      sortList: [[0,0]]
    });
    $("table#alerts").tablesorter({
      sortList: [[3,1]]
    });
  }
  
});