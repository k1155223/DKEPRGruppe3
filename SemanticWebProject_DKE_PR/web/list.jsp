<%@ page import="org.apache.jena.query.*"
         import="java.lang.String"
         import="Zuzuege_Wegzuzege.*"
         import="TripleStore.*"
         import="java.util.ArrayList"
%>
<%@ page import="TripleStore.CreateRDF" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Our Semantic App</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
  <script type='text/javascript'>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
              <title>Our Semantic App</title>
      <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <script type='text/javascript'>
        google.charts.load('current', {'packages':['table']});
        google.charts.setOnLoadCallback(drawTable);
        function drawTable() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'City');
            data.addColumn('number', 'Wegz�ge Gesamt');
            data.addColumn('number', 'Zuz�ge Gesamt');

            var bezirk;
            var zuzuege_gesamt;
            var breitengrad;
            var laengengrad;

            <%
                ZuzuegeWegzuege zuzuege_wegzuege = new ZuzuegeWegzuege();
                ArrayList<zuzug_wegzug_eintrag> zzwz = zuzuege_wegzuege.getZuzuegeWegzuege();
            for(int i = 0; i < zzwz.size(); i++ ){
            %>
            bezirk = "<%=zzwz.get(i).getBezirk()%>";
            wegzuege_gesamt = <%=zzwz.get(i).getWegzug_frauen()+zzwz.get(i).getWegzug_maenner()%>;
            zuzuege_gesamt = <%=zzwz.get(i).getZuzug_maenner()+zzwz.get(i).getZuzug_frauen()%>;
            data.addRows([ [bezirk,  {v: wegzuege_gesamt, f: String(wegzuege_gesamt)},{v: zuzuege_gesamt, f:  String(zuzuege_gesamt)}] ] );
            <%
              }
            %>
            var table = new google.visualization.Table(document.getElementById('table_div'));
            table.draw(data, {showRowNumber: true, width: '100%', height: '200px'});
        }
        function goToNewPage()
        {
            var url = document.getElementById('list').value;
            if(url != 'none') {
                window.location = url;
            }
        }
    </script>
</head>

<body>
<center>
    <font face="verdana">
        <h2>Let's move!</h2>
        <img src="Zz.png" alt="Let's move" style="width:364px;height:240px;">
        <ul>
            <li><a href="map.jsp" >Map</a></li>
            <li><a href="list.jsp" >Liste</a></li>
            <li><a href="zuzuege_gesamt.jsp">Zuzüge gesamt</a></li>
            <li><a href="wegzuege_gesamt.jsp">Wegzüge gesamt</a></li>
            <li><a href="relation_zuzuege_wegzuege.jsp">Relation Wegzüge zu Zuzüge</a></li>
        </ul>
    </font>



    <div id="table_div"></div>

</center>


</body>

</html>