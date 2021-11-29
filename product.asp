<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Manufacture</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
     <!--#include file ="Admin/navbar.asp"-->
  <h1 style="text-align: center; margin-top: 5%;">Product Production</h1>
  <div class="" style="margin-left: 30%;  margin-right: 30%;">
    <form method="post" id="form1">

      <div class="mb-3">
        <label for="" class="form-label">Name</label>
        <input type="text" class="form-control" name="name" id="" placeholder="">
      </div>
      <div class="mb-3">
        <label for="" class="form-label">SKU</label>
        <input type="text" class="form-control" name="sku" id="" placeholder="">
      </div>



      <!-- <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01">Parts Name</label>
                <select class="form-select" id="inputGroupSelect01">
                  <option selected>Choose...</option>
                  <option value="1">DB_Parts_ID</option>
                  <option value="2">DB_Parts_ID</option>
                </select>
              </div> -->
      <!-- <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01">Supplier ID</label>
                <select class="form-select" id="inputGroupSelect01">
                  <option selected>Choose...</option>
                  <option value="1">DB_Supplier_ID</option>
                  <option value="2">DB_Supplier_ID</option>
                </select>
              </div> -->
      <!-- <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01">Quantity</label>
                <select class="form-select" id="inputGroupSelect01">
                  <option selected>Choose...</option>
                  <option value="1">DB_Quantity</option>
                  <option value="2">DB_Quantity</option>
                </select>
              </div> -->
      <!-- <div class="mb-3">
                <label for="" class="form-label">Cost</label>
                <input type="text" class="form-control" id="" placeholder="Quantity*Parts_Price" readonly>
            </div> -->

      <!-- <div class="mb-3">
                <label for="" class="form-label">Supervisor ID</label>
                <input type="text" class="form-control" id="" placeholder="Purchase By Supervisor" readonly>
            </div> -->




      <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <textarea id="xmlSrc" cols="70" rows="5"></textarea>

    <div id="results">

    </div>

  </div>



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>

    <script>

      if(localStorage.getItem("name") === "Admin"){
            //alert("Yes")
            




                 var btn = document.getElementById("logout")

                  btn.onclick = function () {
                    localStorage.removeItem("name")
                    location.reload()
                }
        }
        else{
            window.location.replace("http://localhost/project/admin/adminlogin.asp")
           // alert("No")
        }



      // You can use jQuery to build XML document:
  
  function buildXmlFromForm(form) {
    var xml = $('<XMLDocument />');
    xml.append (
      $('<Product />').append(
        $('<Name />').text(form.find("input[name='name']").val())
      ).append(
        $('<Sku />').text(form.find("input[name='sku']").val())
      )
    );
  
    return xml.html();
  }
  
  // you should use POST or PUT method (not GET) to post xml-data to server side
  $( "#form1" ).submit(function(event) {
    event.preventDefault();
    $("#results").append("<ul></ul>");
    var xmlString = buildXmlFromForm($(this));
    
    $("#xmlSrc").val(xmlString);
    $.ajax({
      type: "POST",
      dataType: 'xml',
     // url: 'response.xml',


      //url: 'myfile.asp',
      //data: xmlString,
      // success: function(respData) {
      //   $("<li></li>").html("ok: "+respData).appendTo("#results ul");
      // //   $post("myfile.asp",{libid:respData})
      //   console.log(respData);
      // },
      // error: function(errorData) {
      //   $("<li></li>").html("error: "+errorData.statusText).appendTo("#results ul");
      //   console.log(errorData);
      // }
    });


     $.post("productDemoSkuPage.asp",{
         file:xmlString,
         
     }).done(function(){
        console.log("POst Done Last")
        window.location.replace("http://localhost/project/productmenufacturepage2.asp");
     })
    console.log(xmlString)
  });
  </script>
</body>

</html>