<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    
   <!--#include file ="navbar.asp"-->
   <br>
  <div class='container'>
    <div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
        <div class="card-header">Stock</div>
        <div class="card-body">
            <h1 class="card-title">Total: <span id="stockData"></span> </h1>
            
        </div>
    </div>

                <!-- <h5 style="text-align:center">Purchase Parts from Supplier</h5>
    <table class="table table-dark table-striped" id="tableBody">
        
        <thead>
            <tr>
            <td>Parts Name</td>
            <td>Part ID</td>
             <td>Quantity</td> 
            

        </tr>
        </thead>
        <tbody>

        </tbody>
    </table> -->

    <h5 style="text-align:center">Parts</h5>

    <table class="table table-dark table-striped" id="tableBody2">
        
        <thead>
            <tr>
            <td>Parts Name</td>
            <td>Part ID</td>
            <!-- <td>Quantity</td> -->
            

        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>



  </div>


















   
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
        var stockdata = 0;

        $.ajax({
            type: 'GET',
            url: 'http://localhost/project/stockdatacountxml.asp',           // The file path.
            dataType: 'xml',
            success: function (xml) {
                //find all book tags, loop them and append to table body
                $(xml).find('Stoke').each(function () {

                    myData = xml;
                   

                        stockdata = $(this).find('sum_quantity').text()

                        $("#stockData").html(stockdata)


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

                    myData = xml;
                    // Append new data to the tbody element.
                    $('#tableBody tbody').append(
                        '<tr>' +
                        '<td>' +
                        $(this).find('parts_name').text() + '</td> ' +
                        '<td>' +
                        $(this).find('parts_id').text() + '</td> ' +
                       // '<td>' +
                        //$(this).find('quantity').text() + '</td> ' +
                        '</tr>'
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

                    myData = xml;
                    // Append new data to the tbody element.
                    $('#tableBody2 tbody').append(
                        '<tr>' +
                        '<td>' +
                        $(this).find('Parts_name').text() + '</td> ' +
                        '<td>' +
                        $(this).find('parts_id').text() + '</td> ' +
                        //'<td>' +
                       // $(this).find('quantity').text() + '</td> ' +
                        '</tr>'
                    );
                    


                });

            }
        });





    </script>
</body>
</html>