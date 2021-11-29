<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Parts</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>

    
    <!--#include   file ="Admin/navbar.asp"-->

    <h1 style="text-align: center; margin-top: 5%;">Add Parts (Company)</h1>
    <div class="" style="margin-left: 30%;  margin-right: 30%;">
        <form method="post" id="form1">
            <div class="mb-3">
                <label for="" class="form-label">Parts Name</label>
                <input type="text" class="form-control" name="name" id="" aria-describedby="">

            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Price</label>
                <input type="text" name="price" class="form-control" id="">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Quantity</label>
                <input type="text" name="quantity" class="form-control" id="">
            </div>

            <!-- <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01">Producer ID</label>
                <select class="form-select" name="maker_id" id="dropdown">
                    <option selected>Choose...</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option> 
                </select>
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




















            const parts_id_sku = Math.floor(Math.random() * (20000 - 2000 + 1)) + 2000;



        function buildXmlFromForm(form) {
            var xml = $('<XMLDocument />');
            xml.append(
                $('<Parts />').append(
                    $('<Name />').text(form.find("input[name='name']").val())
                ).append(
                    $('<Price />').text(form.find("input[name='price']").val())
                ).append(
                    $('<Quantity />').text(form.find("input[name='quantity']").val())
                ).append(
                    // $('<maker_id />').text(form.find("select[name='maker_id']").val())
                    $('<maker_id />').text(1)
                ).append(
                    // $('<maker_id />').text(form.find("select[name='maker_id']").val())
                    $('<parts_id_sku />').text(parts_id_sku)
                )
            );

            return xml.html();
        }

        // you should use POST or PUT method (not GET) to post xml-data to server side
        $("#form1").submit(function (event) {
            event.preventDefault();
            $("#results").append("<ul></ul>");
            var xmlString = buildXmlFromForm($(this));

            $("#xmlSrc").val(xmlString);
            $.ajax({
                type: "POST",
                dataType: 'xml',
                // url: 'response.xml',
                  url: 'partsInsert.asp',
                data: xmlString,
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
              $.post("partsInsert.asp", {
                 file: xmlString
              })
            console.log(xmlString)
        });

        $.ajax({
            type: 'GET',
            url: 'http://localhost/project/supplierfulllist.asp',           // The file path.
            dataType: 'xml',
            success: function (xml) {
                //find all book tags, loop them and append to table body
                $(xml).find('supplier').each(function () {

                    myData = xml;
                   
                    $('#dropdown').append(

                        '<option value=' + $(this).find('supplier_id').text() + ' >' + $(this).find('name').text() + '</option> '

                    );


                });

            }
        });
    </script>
</body>

</html>