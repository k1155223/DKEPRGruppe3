<%@ page import="org.apache.jena.query.*"
         import="java.lang.String"
         import="Zuzuege_Wegzuzege.*"
         import="TripleStore.*"
%>
<%@ page import="TripleStore.CreateRDF" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="format.css">
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
	<h1>Let's move!</h1>
	<img src="Zz.png" alt="Let's move" style="width:364px;height:240px;">
    <div class="description">
    <p>
        Du wohnst in Linz und suchst nacht alternativen Wohnorten bzw. möchtest woanders deine Zukunft aufbauen?
        Oder du bist einfach daran interessiert, wie begehrt dein Bezirk/Bundesland bei früheren Wahl-LinzerInnen ist?
        Bei unserer "Let's Move!"-Seite findest du all diese Infos (basierend auf den letzten Zuzugs- und Wegzugs-Daten der Stadt Linz von 2014).
    </p>
	</div>
        <form action="servlet" method="post">
        <input type=button value="Go" onclick="goToNewPage()" />

    </form>
</center>
</body>
</html>
