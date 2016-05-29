<%@ page import="org.apache.jena.query.*"
  import="java.lang.String"%><%--
  Created by IntelliJ IDEA.
  User: Florian
  Date: 19/05/16
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%

      String serviceURI =  "http://localhost:3030/ds/query";
      Query query = QueryFactory.create(
              "SELECT ?subject ?predicate ?object " +
                      "WHERE { " +
                      "  ?subject ?predicate ?object " +
                      "} ");
      QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query);
      ResultSet results = q.execSelect(); // get result-set
      //ResultSetFormatter.out(System.out, results); // print results

      out.print(ResultSetFormatter.asXMLString(results));


  %>

  </body>
</html>
