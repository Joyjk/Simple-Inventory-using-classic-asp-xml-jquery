<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>

    <!--#include   file ="Admin/navbar.asp"-->

    <h1 style="text-align: center; margin-top: 5%;">Supplier Registration</h1>
    <div class="" style="margin-left: 30%;  margin-right: 30%;">
        <form method="post" id="form1">
            <div class="mb-3">
                <label for="" class="form-label"> Name</label>
                <input type="text" name="name" class="form-control" id="" aria-describedby="">

            </div>
            <!-- <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01">Roll</label>
                <select class="form-select" id="inputGroupSelect01">
                  <option selected>Choose...</option>
                  <option value="1">Supervisor</option>
                  <option value="2">Peon</option>
                </select>
              </div> -->
            <div class="mb-3">
                <label for="" class="form-label">Address</label>
                <input type="text" name="address" class="form-control" id="">
            </div>




            <button type="submit" value="Submit" class="btn btn-primary">Submit</button>
        </form>

        <textarea id="xmlSrc" cols="70" rows="5"></textarea>

        <div id="results">
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

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















            function buildXmlFromForm(form) {
                var xml = $('<XMLDocument />');
                xml.append(
                    $('<Supplier />').append(
                        $('<Name />').text(form.find("input[name='name']").val())
                    ).append(
                        $('<Address />').text(form.find("input[name='address']").val())
                    )
                );

                return xml.html();
            }



            $("#form1").submit(function (event) {
                event.preventDefault();
                $("#results").append("<ul></ul>");
                var xmlString = buildXmlFromForm($(this));

                $("#xmlSrc").val(xmlString);
                $.ajax({
                    type: "POST",
                    dataType: 'xml',
                    // url: 'response.xml',
                    url: 'supplierReg.asp',
                   // data: xmlString,

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
               $.post("supplierReg.asp", {
                   file: xmlString
               })
                console.log(xmlString)
            });
        </script>
</body>

</html>