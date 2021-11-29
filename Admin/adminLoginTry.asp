<%
        Dim con ' for connection Object 
        Dim rec ' for Recordset Object
        Dim rs ' to hold pointer
        Dim x ' for loop counter variable
        ' create a connection object
        Set con = Server.createObject("ADODB.Connection")
        
        ' create a recordset Object
        Set rec = Server.createObject("ADODB.recordset")
        con.open "Provider=SQLOLEDB; Data Source = (local); Initial Catalog = mytest; User Id = Joy; Password=1234"
        Set rs =  con.execute("Select * from Student")


        
    %>