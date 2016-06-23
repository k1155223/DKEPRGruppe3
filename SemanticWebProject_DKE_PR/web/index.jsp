<%@ page import="org.apache.jena.query.*"
         import="java.lang.String"
         import="Zuzuege_Wegzuzege.*"
         import="TripleStore.*"
%>
<%@ page import="TripleStore.CreateRDF" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Our Semantic App</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
  <script type='text/javascript'>
   
    
function goToNewPage()
    {
	<% CreateRDF.create();%>
            window.location = "zzm.html";
            
        
    }
  </script>
</head>
<body>

	<h2>Let's move!</h2>
	<img src="Zz.png" alt="Let's move" style="width:364px;height:240px;"> 
	<form action="servlet" method="post">
        <input type=button value="Go" onclick="goToNewPage()" />

    </form>
	</font>

<%
    String serviceURI =  "http://localhost:3030/ds/query";
    Query query = QueryFactory.create(
            "PREFIX rdf: <http://www.dke.at/bezirk#>" +
            "SELECT ?Bezirk ?Zuzuege_M ?Zuzuege_W ?Zuzuege_I ?Zuzuege_A " +
                    "WHERE { " +
                    " ?x rdf:name ?Bezirk. " +
                    " ?x rdf:Zuzuege_Maenner ?Zuzuege_M. " +
                    " ?x rdf:Zuzuege_Frauen ?Zuzuege_W. " +
                    " ?x rdf:Zuzuege_InlaenderInnen ?Zuzuege_I. " +
                    " ?x rdf:Zuzuege_AuslaenderInnen ?Zuzuege_A. " +
                    "} ");
    QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query);
    ResultSet results = q.execSelect(); // get result-set
    //ResultSetFormatter.out(System.out, results); // print results

    out.print(ResultSetFormatter.asXMLString(results));
%>

</body>
</html>
