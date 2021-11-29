
<% 
Set oXML = Server.CreateObject("MSXML2.DomDocument.6.0")
Set oCmd = Server.CreateObject("ADODB.Command")
oCmd.ActiveConnection = "Provider=SQLOLEDB; Data Source = (local); Initial Catalog = InventorySystem; User Id = Joy; Password=1234"
oCmd.Properties("Output Stream") = oXML
oXml.async = false
'oCmd.CommandText = "SELECT CustomerId, Name, Country from CustomerDetails for xml auto, elements, root('Customers')"
oCmd.CommandText = "EXEC spSumOfStock"
oCmd.Execute , , 1025
Response.ContentType="text/xml"
Response.Write("<?xml version='1.0' encoding='utf-8'?>")
Response.Write oXML.xml 


'oXML.Save(xml,1)
Set oXML = Nothing
Set oCmd = Nothing
%>