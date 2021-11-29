<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase From Supplier new </title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</head>

<body>

    
   <!--#include file ="../admin/navbar.asp"-->

    
    <div class="container">
        <h2 style="text-align: center;">Purchase From Supplier New</h2>
        <form method="post" id="form1">






            <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01">Select Parts </label>
                <select class="form-select" name="partsid" id="partswiseFromPurchase">
                    <option selected>Choose...</option>
                    <!-- <option value="1">DB_Parts_id</option>
                    <option value="2">DB_Parts_id</option> -->
                </select>
            </div>
            <!-- <div class="mb-3">
                <label for="" class="form-label">Part Name</label>
                <input type="text" class="form-control" id="partName" name="partName">
            </div> -->

            <!-- <div class="mb-3">
                <label for="" class="form-label">Parts Id</label>
                <input type="text" class="form-control" id="partsId" name="partsId">
            </div> -->


            <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01">Select Supplier </label>
                <select class="form-select" name="supplierID" id="supplierID">
                    <option selected>Choose...</option>
                    <!-- <option value="1">DB_Parts_id</option>
                    <option value="2">DB_Parts_id</option> -->
                </select>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">Quantity</label>
                <input type="number" min="0" class="form-control" id="quantityA" name="quantityA">
            </div>
            <div class="mb-3">
                <label for="" class="form-label">Supervisor ID</label>
                <input type="text" value="9" class="form-control" id="supervisorID" name="supervisorID" readonly>
            </div>

            <input type="submit" value="Submit">


        </form>
        <hr />
        <textarea id="xmlSrc" cols="70" rows="5"></textarea>

        <div id="results">

        </div>
    </div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>

        var oldQuantity = 0;
        var totalQuantity = 0;


        // if(localStorage.getItem("name") === "Admin"){
        //     //alert("Yes")
            




        //          var btn = document.getElementById("logout")

        //           btn.onclick = function () {
        //             localStorage.removeItem("name")
        //             location.reload()
        //         }
        // }
        // else{
        //     window.location.replace("http://localhost/project/admin/adminlogin.asp")
        //    // alert("No")
        // }




        // $.ajax({
        //     type: 'GET',
        //     url: 'http://localhost/project/stockProductPurchase.asp',           // The file path.
        //     dataType: 'xml',
        //     success: function (xml) {
        //         //find all book tags, loop them and append to table body
        //         $(xml).find('Stock').each(function () {

        //             myData = xml;
        //             // Append new data to the tbody element.
                  
        //             $('#partswiseFromPurchase').append(

        //                 '<option value=' + $(this).find('parts_id').text() + ' >' + $(this).find('parts_name').text() + '</option> '

        //             );


        //         });

        //     }
        // });
        $.ajax({
            type: 'GET',
            url: 'http://localhost/project/partOwnListXxmlList.asp',           // The file path.
            dataType: 'xml',
            success: function (xml) {
                //find all book tags, loop them and append to table body
                $(xml).find('own_part').each(function () {

                    myData = xml;
                    // Append new data to the tbody element.
                  
                    $('#partswiseFromPurchase').append(

                        '<option value=' + $(this).find('parts_id').text() + ' >' + $(this).find('Parts_name').text() + '</option> '

                    );


                });

            }
        });

        $.ajax({
            type: 'GET',
            url: 'http://localhost/project/supplierfulllist.asp',           // The file path.
            dataType: 'xml',
            success: function (xml) {
                //find all book tags, loop them and append to table body
                $(xml).find('supplier').each(function () {

                    myData = xml;
                    // Append new data to the tbody element.
                  
                    $('#supplierID').append(

                        '<option value=' + $(this).find('supplier_id').text() + ' >' + $(this).find('name').text() + '</option> '

                    );


                });

            }
        });



        $("#partswiseFromPurchase").change(
            function () {
                console.log(this.value)

               // $('#tableBody tbody').empty();

               

                $.ajax({
                    type: "POST",
                    url: "purchaseSingleProductQty.asp",
                    dataType: "xml",
                    data:{
                        partsid: this.value
                    },
                    success: function (xml) {
                        $(xml).find('stocks').each(function () {

                            oldQuantity = $(this).find('quantity').text()
                            

                        });
                        console.log(oldQuantity);
                    }
                    

                })


                // $('#tableBody tbody').append(
                //     '<tr>' +
                //     '<td>' +
                //     s.find('customerid').text() + '</td> ' +
                //     '<td>' +
                //     s.find('name').text() + '</td> ' +
                //     '<td>' +
                //     s.find('country').text() + '</td> ' +
                //     '<td>'
                // );
            }


        );










        // You can use jQuery to build XML document:

       // var parts_id = Math.floor((Math.random() * 100) + 1)

       //partswiseFromPurchase

        function buildXmlFromForm(form) {
            var xml = $('<XMLDocument />');

            totalQuantity = Number( form.find("input[name='quantityA']").val())+Number(oldQuantity) 

            xml.append(
                $('<Purchase />').append(
                    $('<part_id />').text($("#partswiseFromPurchase").val())
                ).append(
                    $('<supplier_id />').text($("#supplierID").val())
                ).append(
                    $('<supervisor_id />').text(form.find("input[name='supervisorID']").val())
                ).append(
                    $('<quantity />').text(totalQuantity)
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


                   url: 'myfile.asp',
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


              $.post("purchaseNewAdd.asp",{
                  file:xmlString
              })
            console.log(xmlString)
        });
    </script>
</body>

</html>