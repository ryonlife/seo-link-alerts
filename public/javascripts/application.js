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
  
  var numeric_or_text = "text";
  $.tablesorter.addParser({ 
    id: 'string_starts_with_number', 
    is: function(s) { 
      return false; 
    }, 
    format: function(s) {
      var numeric = s.match(/(^[0-9]+)\s[domain|feed]/)
      if(numeric) {
        s = numeric[1]
        numeric_or_text = "numeric";
      }
      console.log(s);
      console.log(numeric_or_text);
      return s;
    }, 
    type: numeric_or_text
  });  
  
  if(records) {
    $("table#feeds").tablesorter({
      sortList: [[3,1]]
    });
    $("table#alerts").tablesorter({
      sortList: [[1,1]],
      headers: {
        // 2: {sorter: 'string_starts_with_number'},
        // 3: {sorter: 'string_starts_with_number'}
      }
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

