<%@ page import="org.apache.jena.query.*"
         import="java.lang.String"
         import="Zuzuege_Wegzuzege.*"
%><%--
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
</head>
<body>

<H1> Dies ist ein Test </H1>

<a href="zuzuege.jsp">Zuzuege-Liste</a>

<a href="wegzuege.jsp">wegzuege-Liste</a>

<%
    Testfile testcall = new Testfile();
    String teststring = testcall.getHello();
%>

<H1> <% out.print(teststring); %> </H1>
<H2> <% out.print("Print test");  %>  </H2>


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
