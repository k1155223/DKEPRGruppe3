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

            /* Spalten für die Tabelle */

            data.addColumn('string', 'Bezirk/Bundesland');
            data.addColumn('number', 'Zuzüge Gesamt');
            data.addColumn('number', 'Zuzüge Männer');
            data.addColumn('number', 'Zuzüge Frauen');
            data.addColumn('number', 'Zuzüge Inländer');
            data.addColumn('number', 'Zuzüge Ausländer');
            data.addColumn('number', 'Wegzüge Gesamt');
            data.addColumn('number', 'Wegzüge Männer');
            data.addColumn('number', 'Wegzüge Frauen');
            data.addColumn('number', 'Wegzüge Inländer');
            data.addColumn('number', 'Wegzüge Ausländer');


            var bezirk;
            var zuzuege_gesamt;
            var wegzuege_gesamt;

            var zuzug_maenner;
            var zuzug_frauen;
            var zuzug_inlaender;
            var zuzug_auslaender

            var wegzug_maenner;
            var wegzug_frauen;
            var wegzug_inlaender;
            var wegzug_auslaender

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

            zuzug_maenner = <%=zzwz.get(i).getZuzug_maenner()%>;
            zuzug_frauen = <%=zzwz.get(i).getZuzug_frauen()%>;
            zuzug_inlaender = <%=zzwz.get(i).getZuzug_inlaender()%>;
            zuzug_auslaender = <%=zzwz.get(i).getZuzug_auslaender()%>;

            wegzug_maenner = <%=zzwz.get(i).getWegzug_maenner()%>;
            wegzug_frauen = <%=zzwz.get(i).getWegzug_frauen()%>;
            wegzug_inlaender = <%=zzwz.get(i).getWegzug_inlaender()%>;
            wegzug_auslaender = <%=zzwz.get(i).getWegzug_auslaender()%>;


            /* f: String bedeutet, dass die Variable als String ausgegeben wird (sie lassen sich dennoch sortieren), dadurch sind keine englischen Tausenderkommas in den Werten, durch die die Werte leicht als Dezimlawerte verwechselt werden können */
            data.addRows([ [bezirk, {v: zuzuege_gesamt, f:  String(zuzuege_gesamt)}, {v: zuzug_maenner, f: String(zuzug_maenner)}, {v: zuzug_frauen, f:  String(zuzug_frauen)}, {v: zuzug_inlaender, f: String(zuzug_inlaender)}, {v: zuzug_auslaender, f:  String(zuzug_auslaender)}, {v: wegzuege_gesamt, f:  String(wegzuege_gesamt)}, {v: wegzug_maenner, f: String(wegzug_maenner)}, {v: wegzug_frauen, f:  String(wegzug_frauen)}, {v: wegzug_inlaender, f: String(wegzug_inlaender)}, {v: wegzug_auslaender, f:  String(wegzug_auslaender)}] ] );
            <%
              }
            %>
            var table = new google.visualization.Table(document.getElementById('table_div'));
            table.draw(data, {showRowNumber: true, width: '100%', height: '80%'});
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
    <h2>Let's move!</h2>
    <img src="Zz.png" alt="Let's move" style="width:364px;height:240px;">

    <form action="servlet" method="post">
        <select id = "list" accesskey="target">
            <option value = "list.jsp" >&Uuml;bersichtsliste</option>
            <option value = "zuzuege.jsp">Zuz&uuml;ge nach Linz</option>
            <option value = "wegzuege.jsp">Wegz&uuml;ge von Linz</option>
            <option value = "relation_zuzuege_wegzuege.jsp">Relation zwischen Wegz&uuml;ge und Zuz&uuml;ge</option>
        </select>
        <input type=button value="Go" onclick="goToNewPage()" />
    </form>

    <p>
        &Uuml;bersichtsliste über alle Zuzüge nach Linz und Wegzüge von Linz gelistet nach Bezirken und Bundesländern. Mit einem Linksclick auf eine Spaltenüberschrift wird die Tabelle sortiert anhand des ausgew&auml;hlten Werts.
        <br /> Info: Zuz&uuml;ge gesamt = Zu&uuml;ge M&auml;nner + Zu&uuml;ge Frauen = Zu&uuml;ge Inl&auml;nder + Zu&uuml;ge Aus&auml;nder
        <br /> Zuz&uuml;ge  Wegz&uuml;ge gesamt = Weg&uuml;ge M&auml;nner + Weg&uuml;ge Frauen = Weg&uuml;ge Inl&auml;nder + Weg&uuml;ge Aus&auml;nder
    </p>

    <hr />
    <div id="table_div"></div>

</center>


</body>

</html>