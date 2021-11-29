<!DOCTYPE html>
<html>

<head>
    <title>Supplier Details </title>
    <!--Include Bootstrap CSS-->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
        crossorigin="anonymous"> -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
</head>

<body>

    <!--#include   file ="Admin/navbar.asp"-->
    <!-- <Select id="dropdown">
        <option value="">Select..</option>
    </Select> -->

    <div class="container">
        <h3 style="margin-left:35%">Suppliers List</h3>
    <table class="table table-success table-striped" id="tableBody">
        <thead>
            <tr>
                <th>Supplier ID</th>
                <th>Name</th>
                <th>Adddress</th>
                <!-- <th>Supplier Name</th> -->

            </tr>
        </thead>
        <tbody>

        </tbody>

    </table>
    </div>
</body>


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






        //jQuery on button click Call
        // $('#btn').click(function () {


        $('#tableBody tbody').empty();       // Clear the table body.
        //ajax call to load XML and parse it

        var myData;


        $.ajax({
            type: 'GET',
            url: 'http://localhost/project/supplierfulllist.asp',           // The file path.
            dataType: 'xml',
            success: function (xml) {
                //find all book tags, loop them and append to table body
                $(xml).find('supplier').each(function () {

                    myData = xml;
                    // Append new data to the tbody element.
                    $('#tableBody tbody').append(
                        '<tr>' +
                        '<td>' +
                        $(this).find('supplier_id').text() + '</td> ' +
                        '<td>' +
                        $(this).find('name').text() + '</td> ' +
                        '<td>' +
                        $(this).find('address').text() + '</td> ' +
                        ' </tr>' 
                    );
                    


                });

            }
        });
        


    });






</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>