<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Menufacture Product</title>
</head>

<body>

    <!--#include file ="Admin/navbar.asp"-->
    <br>
<div style="margin-left:20%; margin-right:30%;">
    <div class="container" >
        <h1>Menufacture Product</h1>
        <form method="post" id="form1">
            <select class="form-select" name="dropdownProduct" id="dropdownProduct" aria-label="Default select example">
                <option selected>Select Product to Menufacture </option>
                <!-- <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option> -->
            </select>
            <br>
            <select class="form-select" name="dropdownPart2s" id="dropdownParts" aria-label="Default select example">
                <option selected>Select Parts to Menufacture </option>
                <!-- <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option> -->
            </select>
            <br>

            <select class="form-select" name="quantityOfItem" aria-label="Default select example" id="quantityOfItem">
                <option selected>Select Quantity </option>
                <!-- <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option> -->
            </select>

            <br>

            <div class="input-group mb-3">
                <span class="input-group-text">$</span>
                <!-- <span class="input-group-text">0.00</span> -->
                <input type="text" name="priceinput" class="form-control" value="20">
            </div>


            <div class="d-grid gap-2">
                <button class="btn btn-primary" type="submit" value="Submit">Submit</button>

            </div>





        </form>


        <textarea id="xmlSrc" cols="70" rows="5"></textarea>

        <div id="results">

        </div>
    </div>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $(document).ready(function () {



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

            var quantityStockWise;
            var quantityRemaining;


            $.ajax({
                type: 'GET',
                url: 'http://localhost/project/productDemoSkuReturnXML.asp',           // The file path.
                dataType: 'xml',
                success: function (xml) {
                    //find all book tags, loop them and append to table body
                    $(xml).find('sku').each(function () {


                        $('#dropdownProduct').append(

                            '<option value=' + $(this).find('product_sku').text() + ' >' + $(this).find('product_name').text() + '</option> '

                        );


                    });

                }
            });

            $.ajax({
                type: 'GET',
                url: 'http://localhost/project/stockProductPurchase.asp',           // The file path.
                dataType: 'xml',
                success: function (xml) {
                    //find all book tags, loop them and append to table body
                    $(xml).find('Stock').each(function () {


                        $('#dropdownParts').append(

                            '<option value=' + $(this).find('parts_id').text() + ' >' + $(this).find('parts_name').text() + '</option> '

                        );


                    });

                }
            });

            $.ajax({
                type: 'GET',
                url: 'http://localhost/project/partOwnListXxmlList.asp',           // The file path.
                dataType: 'xml',
                success: function (xml) {
                    //find all book tags, loop them and append to table body
                    $(xml).find('own_part').each(function () {


                        $('#dropdownParts').append(

                            '<option value=' + $(this).find('parts_id_sku').text() + ' >' + $(this).find('Parts_name').text() + '</option> '

                        );


                    });

                }
            });

            $("#dropdownParts").change(
                function () {
                    console.log(this.value)

                    // $('#tableBody tbody').empty();
                    // $("#dropdownParts").empty()
                    quantityStockWise = 0;

                    $.ajax({
                        type: "POST",
                        url: "StockWiseQuantityXML.asp",
                        dataType: "xml",
                        data: {
                            partsid: this.value
                        },
                        success: function (xml) {
                            $(xml).find('stock').each(function () {
                                quantityStockWise = 0;
                                // $('#tableBody tbody').append(
                                //     '<tr>' +
                                //     '<td>' +
                                //     $(this).find('customerid').text() + '</td> ' +
                                //     '<td>' +
                                //     $(this).find('name').text() + '</td> ' +
                                //     '<td>' +
                                //     $(this).find('country').text() + '</td> ' +
                                //     '<td>'
                                // );

                                quantityStockWise = $(this).find('quantity').text()

                                console.log(quantityStockWise)
                            });

                            for (var i = 1; i <= quantityStockWise; i++) {
                                $('#quantityOfItem').append(

                                    '<option value=' + i + ' >' + i + '</option> '

                                );
                            }


                        }

                    })





                    // console.log(typeof s)


                }


            );



            // You can use jQuery to build XML document:

            function buildXmlFromForm(form) {
                quantityRemaining = quantityStockWise - $("#quantityOfItem").val()
                var xml = $('<XMLDocument />');
                xml.append(
                    $('<Product />').append(
                        $('<product_sku />').text($("#dropdownProduct").val()) //form.find("input[name='dropdownProduct']").val()
                    ).append(
                        $('<parts_id />').text($("#dropdownParts").val())   //form.find("input[name='dropdownPart2s']").val()
                    ).append(
                        $('<Quantity />').text($("#quantityOfItem").val())     ///form.find("input[name='quantityOfItem']").val()
                    ).append(
                        $('<Cost />').text(form.find("input[name='priceinput']").val())
                    ).append(
                        $('<RemainingQTY />').text(quantityRemaining)
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
                   // url: 'myfile.asp',
                  //  data: xmlString,
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
                $.post("productMenufacturePage2XmlInsert.asp", {
                    file: xmlString
                }).done(function(){
                    location.reload()
                })
                console.log(xmlString)
            });





        });
    </script>
</body>

</html>