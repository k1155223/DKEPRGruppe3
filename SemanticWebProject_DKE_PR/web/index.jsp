<%@ page import="org.apache.jena.query.*"
         import="java.lang.String"
         import="Zuzuege_Wegzuzege.*"
         import="TripleStore.*"
%>
<%@ page import="TripleStore.CreateRDF" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Let's move!</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
  <script type='text/javascript'>
   
    
function goToNewPage()
    {
	<% CreateRDF.create();%>
            window.location = "zuzuege.jsp";
    }
  </script>
</head>
<body>
<center>
	<h2>Let's move!</h2>
	<img src="Zz.png" alt="Let's move" style="width:364px;height:240px;"> 
	<form action="servlet" method="post">
        <input type=button value="Go" onclick="goToNewPage()" />

    </form>
</center>
</body>
</html>
