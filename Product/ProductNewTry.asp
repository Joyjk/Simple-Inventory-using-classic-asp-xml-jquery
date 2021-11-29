<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>

    
   <!--#include file ="../Admin/navbar.asp"-->
    <div class="container">
        <h1 style="text-align: center;">Product Menufacture </h1>
    <form method="post" id="form1">
        <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping">Name</span>
            <input type="text" class="form-control" id="productname" placeholder="Name" aria-label="Username"
                aria-describedby="addon-wrapping">
        </div>

        <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping">Sku</span>
            <input type="text" class="form-control" id="productsku" placeholder="Sku" aria-label="Username"
                aria-describedby="addon-wrapping">
        </div>

        <select class="form-select" id="dropdownMulti" multiple aria-label="multiple select example">
            <option selected>Select Parts </option>
            <!-- <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option> -->
        </select>

        <br>
        <button type="submit" value="Submit" class="btn btn-primary">Submit</button>
    </form>


    <!-- <hr />
    <textarea id="xmlSrc" cols="70" rows="5"></textarea>

    <div id="results">

    </div> -->

</div>
    <script>
        // $.ajax({
        //     type: 'GET',
        //     url: 'http://localhost/project/stockProductPurchase.asp',           // The file path.
        //     dataType: 'xml',
        //     success: function (xml) {
        //         //find all book tags, loop them and append to table body
        //         $(xml).find('Stock').each(function () {

        //             myData = xml;
        //             // Append new data to the tbody element.

        //             $('#dropdownMulti').append(

        //                 '<option  value=' + $(this).find('parts_id').text() + ' >' + $(this).find('parts_name').text() + '</option> '

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

                    $('#dropdownMulti').append(

                        '<option  value=' + $(this).find('parts_id').text() + ' >' + $(this).find('Parts_name').text() + '</option> '

                    );


                });

            }
        });






        function buildXmlFromForm(form) {

            var data = document.getElementById("dropdownMulti");

            var data2 = [];
            var data3 = [];
            for (var i = 0; i < data.options.length; i++) {
                console.log(i)
                if (data.options[i].selected == true) {
                   // alert(data.options[i].value);
                    data2.push(data.options[i].value)
                    //data3.push(data.options[i].dd('qty'))
                  // data3.push(data.find('option:selected').attr('data-othervalue'))
                }
            }
            console.log("Data2: " + data2)
             console.log("Data3: "+data3)

                
                var  xml1 = $('<Parts />')
                for (var i = 0; i < data2.length; i++) {
                    //var xml1 = $('<Customer2 />');
                    
                    xml1.append(


                        $('<part />').append(
                            //productname
                            $('<product_name />').text($("#productname").val()),
                            $('<quantity />').text("0"),
                            $('<parts_id />').text(data2[i]),
                            $('<SKU />').text($("#productsku").val())
                              
                        )

                       


                        //productsku

                    );
                }
            



            var xml = $('<XMLDocument />');
            xml.append(
                $('<ProductTbl />').append(
                    //$('<MyData />').text("DATATA"),


                    //$('<CustomerId />').text($("#inscompSelected").val())
                    xml1


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
              $.post("productSendDataXml.asp",{
                  file:xmlString
              })
            console.log(xmlString)






        });



    </script>
</body>

</html>