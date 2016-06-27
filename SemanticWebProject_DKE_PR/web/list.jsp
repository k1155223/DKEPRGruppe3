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
              <title>&Uuml;bersichtsliste</title>
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
            zuzug_inlaender = <%=zzwz.get(i).getZuzug_inlaender()%>;
            zuzug_auslaender = <%=zzwz.get(i).getZuzug_auslaender()%>;

            data.addRows([ [bezirk,  {v: wegzuege_gesamt, f: String(wegzuege_gesamt)},{v: zuzuege_gesamt, f:  String(zuzuege_gesamt)},{v: zuzug_inlaender, f:  String(zuzug_inlaender)}, {v: zuzug_auslaender, f:  String(zuzug_auslaender)}] ] );
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

    <form action="servlet" method="post">
        <select id = "list" accesskey="target">
            <option value = "map.jsp" >&Uuml;bersichtskarte</option>
            <option value = "list.jsp" >&Uuml;bersichtsliste</option>
            <option value = "zuzuege.jsp">Zuz&uuml;ge</option>
            <option value = "wegzuege.jsp">Wegzuege</option>
            <option value = "relation_zuzuege_wegzuege.jsp">Relation zwischen Wegz&uuml;ge und Zuz&uuml;ge</option>
        </select>
        <input type=button value="Go" onclick="goToNewPage()" />
    </form>

    <div id="table_div"></div>

</center>


</body>

</html>