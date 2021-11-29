<%

Option Explicit
Dim test
test = Request.Form("file")
Response.write test









 Dim con 'for connection object
 Dim rec ' for Recordset object 
 Dim id '  to hold id from submitted data
 Dim name '  to hold username from submitted data
 Dim country ' to hold counry from submitted data
 ' create  a Connection Object
  Set con =  Server.createObject("ADODB.Connection")
 ' create a recordset Object 
  Set rec = Server.createObject("Adodb.recordset")
  'open the connection 
  con.Open "Provider=SQLOLEDB; Data Source = (local); Initial Catalog = InventorySystem; User Id = joy; Password=1234"
   
  
    con.execute("EXEC spUpdatePartPurchaseStock  @dataxml='"&test&"'")
    






%>