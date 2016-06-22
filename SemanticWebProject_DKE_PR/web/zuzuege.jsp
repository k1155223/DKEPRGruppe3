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
    <title>Zuzuege</title>
</head>
<body>

<H1> Dies ist ein Test </H1>

<%
    Zuzuege Zuzuegeliste = new Zuzuege();

    for (int i = 0; i < Zuzuegeliste.getZuzuege().size(); i++) {
        out.print(Zuzuegeliste.getZuzuege().get(i).getBezirk());
    }

%>


</body>
</html>
