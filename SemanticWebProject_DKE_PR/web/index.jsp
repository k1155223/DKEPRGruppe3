<%@ page import="org.apache.jena.query.*"
         import="java.lang.String"
         import="Zuzuege_Wegzuzege.*"
<<<<<<< HEAD
         import="TripleStore.*"
%>
<%@ page import="TripleStore.CreateRDF" %><%--
=======
         import="CreateRDF.*"
%><%--
>>>>>>> 809dc6aab3c7bd636f19c142c4e8212b8df2b34c
  Created by IntelliJ IDEA.
  User: Florian
  Date: 19/05/16
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
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

	<font face="verdana">
	<h2>Let's move!</h2>
	<img src="Zz.png" alt="Let's move" style="width:364px;height:240px;"> 
	<form action="servlet" method="post">

<<<<<<< HEAD
<a href="zuzuege.jsp">Zuzuege-Liste</a>

<a href="wegzuege.jsp">wegzuege-Liste</a>

<%
    Testfile testcall = new Testfile();
    String teststring = testcall.getHello();
    CreateRDF.create();
    CreateRDF c = new CreateRDF();
    String teststring1 = c.testPath();
%>

<H1> <%out.print(teststring1);%> </H1>

<H1> <% out.print(teststring); %> </H1>
<H2> <% out.print("Print test");  %>  </H2>
<H2> <% out.print("Print asfdfasdfadsafd");  %>  </H2>
=======
      <input type=button value="Go" onclick="goToNewPage()" />
	</form>
	</font>

>>>>>>> 809dc6aab3c7bd636f19c142c4e8212b8df2b34c

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
