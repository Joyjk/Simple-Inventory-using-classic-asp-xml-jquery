<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Login</title>
</head>

<body>
    <h1 style="text-align: center; margin-top: 10%;">Login</h1>
    <div class="" style="margin-left: 30%;  margin-right: 30%;">
        <form method="post" id="form1">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Name</label>
                <input type="text" name="name" class="form-control" id="name" aria-describedby="emailHelp">

            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="text" name="password" class="form-control" id="pass">
            </div>
            <input type="hidden" name="roll" value="admin" id="roll">
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

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>

        function buildXmlFromForm(form) {
            var xml = $('<XMLDocument />');
            xml.append(
                $('<User />').append(
                    $('<Name />').text(form.find("input[name='name']").val())
                ).append(
                    $('<Roll />').text(form.find("input[name='roll']").val())
                ).append(
                    $('<Password />').text(form.find("input[name='password']").val())
                )
            );

            return xml.html();
        }
        const arrName = [];
        const arrRoll = [];
        const arrPass = [];
        $.ajax({
            type: 'GET',
            url: 'http://localhost/project/userlist.asp',           // The file path.
            dataType: 'xml',
            success: function (xml) {
                //find all book tags, loop them and append to table body
                $(xml).find('user').each(function () {

                    // Append new data to the tbody element.
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

                    arrName.push($(this).find('name').text())
                    arrRoll.push($(this).find('roll').text())
                    arrPass.push($(this).find('password').text())
                    // console.log($(this).find('name').text())
                    // console.log($(this).find('password').text())
                    // console.log($(this).find('roll').text())


                });

            }
        });



        // you should use POST or PUT method (not GET) to post xml-data to server side
        $("#form1").submit(function (event) {
            event.preventDefault();
            $("#results").append("<ul></ul>");
            var xmlString = buildXmlFromForm($(this));

            $("#xmlSrc").val(xmlString);
            // $.ajax({
            //     type: "POST",
            //     dataType: 'xml',


            //     url: 'adminLoginPost.asp',
            //     data: {
            //         file: xmlString
            //     },


            //     success: function (respData) {
            //         //   $("<li></li>").html("ok: "+respData).appendTo("#results ul");
            //         // //   $post("myfile.asp",{libid:respData})
            //         console.log(respData);
            //     },
            //     error: function (errorData) {
            //         $("<li></li>").html("error: " + errorData.statusText).appendTo("#results ul");
            //         console.log(errorData);
            //     }
            // });



            //   $.post("adminLoginPost.asp", {
            //     file: xmlString
            //   })
            // $.post("adminLoginPost.asp", {
            //     data: {
            //         "name":form.find("input[name='name']").val(),
            //         "roll":form.find("input[name='roll']").val(),
            //         "password":form.find("input[name='password']").val()
            //     }
            //   })

            // console.log(xmlString)
            var name = $("#name").val()
            console.log("name: " + name)
            var roll = $("#roll").val()
            console.log("Roll: " + roll)
            var pass = $("#pass").val()
            console.log("Pass: " + pass)

            var count = 0;
            // for (var i = 0; i < arrName.length; i++) {
            //     if (arrName[i] == name) {
            //         console.log("Console: " + i)
            //         if (arrRoll[i] == roll) {
            //             console.log("Console: Roll")
            //             if (arrPass[i] == pass) {
            //                 // document.cookie = "username="+name;
            //                 // console.log( document.cookie)
            //                 //console.log("Done HI")
            //                 localStorage.setItem("name", name)
            //                 window.location.href = "http://localhost/project/admin/adminpannel.asp";
            //             }
            //             else{
            //                 alert("Error User name or password")
            //             }
            //         }
            //     }
            //     else {
            //         //alert("Error User name or password")
            //         // swal("Error", "Name or Password", "error").then(function(){
            //         //location.reload();
            //         //})

            //     }

            // }

            for(var i=0;i<arrName.length;i++){
                if(arrName[i] == name){
                    count = i;
                }
            }
            if(arrName[count] === name && arrPass[count] === pass && arrRoll[count] === roll){
                localStorage.setItem("name", name)
                window.location.href = "http://localhost/project/admin/adminpannel.asp";
            }
            else
            {
                console.log("Wrong input")
                swal("Error", "Name or Password", "error").then(function(){
                    location.reload();
                    })
            }
            
            
            
            });
    </script>
</body>

</html>