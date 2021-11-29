<!DOCTYPE html>
<html>

<head>
    <title>Parts Details </title>
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

    <h3 style="margin-left:35%">Company Own Parts</h3>
    <table class="table table-condensed table-hovered table-striped" id="tableBody">
        <thead>
            <tr>
                <th>Parts Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <!-- <th>Supplier Name</th> -->

            </tr>
        </thead>
        <tbody>

        </tbody>

    </table>
</body>


<script>
    $(document).ready(function () {
        //jQuery on button click Call
        // $('#btn').click(function () {


        $('#tableBody tbody').empty();       // Clear the table body.
        //ajax call to load XML and parse it

        var myData;


        $.ajax({
            type: 'GET',
            url: 'http://localhost/project/partsListXml.asp',           // The file path.
            dataType: 'xml',
            success: function (xml) {
                //find all book tags, loop them and append to table body
                $(xml).find('part').each(function () {

                    myData = xml;
                    // Append new data to the tbody element.
                    $('#tableBody tbody').append(
                        '<tr>' +
                        '<td>' +
                        $(this).find('name').text() + '</td> ' +
                        '<td>' +
                        $(this).find('price').text() + '</td> ' +
                        '<td>' +
                        $(this).find('quantity').text() + '</td> ' +
                        '<td>' +
                        // $(this).find('supplier_name').text() + '</td> ' +
                        '</tr>'
                    );
                    // $('#dropdown').append(

                    //     '<option value=' + $(this).find('customerid').text() + ' >' + $(this).find('name').text() + '</option> '

                    // );


                });

            }
        });
        // $("#dropdown").change(
        //     function () {
        //         console.log(this.value)

        //         $('#tableBody tbody').empty();

               

        //         $.ajax({
        //             type: "POST",
        //             url: "receieve.asp",
        //             dataType: "xml",
        //             data:{
        //                 customerid: this.value
        //             },
        //             success: function (xml) {
        //                 $(xml).find('customer').each(function () {

        //                     $('#tableBody tbody').append(
        //                         '<tr>' +
        //                         '<td>' +
        //                         $(this).find('customerid').text() + '</td> ' +
        //                         '<td>' +
        //                         $(this).find('name').text() + '</td> ' +
        //                         '<td>' +
        //                         $(this).find('country').text() + '</td> ' +
        //                         '<td>'
        //                     );
                            

        //                 });
        //             }

        //         })

        //         console.log(typeof s)

        //         // $('#tableBody tbody').append(
        //         //     '<tr>' +
        //         //     '<td>' +
        //         //     s.find('customerid').text() + '</td> ' +
        //         //     '<td>' +
        //         //     s.find('name').text() + '</td> ' +
        //         //     '<td>' +
        //         //     s.find('country').text() + '</td> ' +
        //         //     '<td>'
        //         // );
        //     }


        // );



    });






</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>