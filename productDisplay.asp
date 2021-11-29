<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Display</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jq-3.6.0/jszip-2.5.0/dt-1.11.3/af-2.3.7/b-2.0.1/b-colvis-2.0.1/b-html5-2.0.1/b-print-2.0.1/cr-1.5.5/sb-1.3.0/sp-1.4.0/datatables.min.css"/>
 

</head>
<body>
    <table id="mytable">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Parts ID</th>
                <th>Parts Name</th>
                <th>Cost</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>4</td>
                <td>Cloth</td>
                <td>$453</td>
            </tr>
            <tr>
                <td>2</td>
                <td>3</td>
                <td>5</td>
                <td>shoe</td>
                <td>$653</td>
            </tr>
            <tr>
                <td>3</td>
                <td>5</td>
                <td>9</td>
                <td>Food</td>
                <td>$253</td>
            </tr>
        </tbody>
    </table>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jq-3.6.0/jszip-2.5.0/dt-1.11.3/af-2.3.7/b-2.0.1/b-colvis-2.0.1/b-html5-2.0.1/b-print-2.0.1/cr-1.5.5/sb-1.3.0/sp-1.4.0/datatables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#mytable').DataTable();
        } );
    </script>
    
</body>
</html>