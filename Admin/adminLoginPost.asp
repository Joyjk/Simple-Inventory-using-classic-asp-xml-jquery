<%
   '' Dim name
    'Dim roll
    'Dim pass
    'name = Request.Form("name")
    'roll = Request.Form("roll")
    'pass = Request.Form("password")
    'Response.write name
    'Response.write roll
    'Response.write pass
    Dim test
     test = Request.Form("file")
    Response.write test


Set oXML = Server.CreateObject("MSXML2.DomDocument.6.0")
Set oCmd = Server.CreateObject("ADODB.Command")
oCmd.ActiveConnection = "Provider=SQLOLEDB; Data Source = (local); Initial Catalog = InventorySystem; User Id = joy; Password=1234"
oCmd.Properties("Output Stream") = oXML
oXml.async = false
'oCmd.CommandText = "SELECT CustomerId, Name, Country from CustomerDetails for xml auto, elements, root('Customers')"
'oCmd.CommandText = "EXEC spLoginDemo @dataxml ='"&test&"'"
oCmd.CommandText = "EXEC AdminLoginTryNew @dataxml ='"&test&"'"
oCmd.Execute , , 1025
Response.ContentType="text/xml"
Response.Write("<?xml version='1.0' encoding='utf-8'?>")
Response.Write oXML.xml 


'oXML.Save(xml,1)
Set oXML = Nothing
Set oCmd = Nothing

%>