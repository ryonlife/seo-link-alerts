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
    $("h2 span").text(records);
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
      $(this).attr({src:"/images/trash_can_selected.gif"});
    },
    function(){
      $(this).attr({src:"/images/trash_can.gif"});
    }
  );
  
  if(records) {
    $("table#feeds").tablesorter({
      sortList: [[3,1]]
    });
    $("table#alerts").tablesorter({
      sortList: [[1,1]]
    });
    $("table#domains").tablesorter({
      sortList: [[1,1]]
    });
  }
  
  var style = {
    color: "#3D3D3D",
    textDecoration: "none",
    cursor: "text"
  }
  $("a[title]")
    .click(function(){
      return false;
    })
    .tipsy({gravity: "e"})
    .hover(
      function(){
        $(this).css(style);
      },
      function(){
        $(this).css(style);
      }
    );
  
});