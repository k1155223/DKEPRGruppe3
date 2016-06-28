<%@ page
         import="java.lang.String"
         import="Zuzuege_Wegzuzege.*"
         import="TripleStore.*"
         import="java.util.ArrayList"
%>
<%@ page import="TripleStore.CreateRDF" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" type="text/css" href="format.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>Zuz&uuml;ge</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>

    <script type='text/javascript'>

        /* Lädt die Karte wieder mit den Daten basierend auf der Auswahl der Radiobuttons ganz unten, z.B. <input type="radio" name="abfrage" onclick="reloadMap('Frauen');">Frauen */
        function reloadMap(abfrage)
        {
            setAbfrage(abfrage);
            drawVisualization();
        }

        function setAbfrage(abfrage)
        {
            abfrage_kategorie = abfrage;
        }

        function getAbfrage(abfrage)
        {
            return abfrage_kategorie;
        }

        google.load('visualization', '1', {'packages': ['geochart']});
        google.setOnLoadCallback(drawVisualization);
        var abfrage_kategorie = 'gesamt'; /* Beim Aufruf der Seite werden zunächst die Gesamtsummen (z.B. zuzuege gesamt) eines jeden zuzug_wegzug_eintrags herangezogen */

        function drawVisualization() {var data = new google.visualization.DataTable();

            data.addColumn('number', 'LATITUDE');
            data.addColumn('number', 'LONGITUDE');
            data.addColumn('string', 'DESCRIPTION');
            data.addColumn('number', 'Value:', 'value');
            data.addColumn({type:'string', role:'tooltip'});

            /* Variablen zum Zwischenspeichern der Werte des jeweiligen zuzug_wegzug_eintrag-Objekts in der for-Schleife for(int i = 0; i < zzwz.size(); i++ ) */
            var bezirk;
            var zuzuege;
            var breitengrad;
            var laengengrad;

            <%
            ZuzuegeWegzuege zuzuege_wegzuege = new ZuzuegeWegzuege();
            ArrayList<zuzug_wegzug_eintrag> zzwz = zuzuege_wegzuege.getZuzuegeWegzuege();

            for(int i = 0; i < zzwz.size(); i++ ){
            %>

            bezirk = "<%=zzwz.get(i).getBezirk()%>";

            /* Anhand des ausgewählten Radiobuttons (siehe weiter unten) werden für die Karte andere Daten herangezogen (beim Aufruf der Seite wird zunächst die Gesamtsummen herangezogen */
            if(abfrage_kategorie == 'gesamt') {
                zuzuege = <%=zzwz.get(i).getZuzuegeSumme()%>;
            }else if(abfrage_kategorie == 'Männer'){
                zuzuege = <%=zzwz.get(i).getZuzug_maenner()%>;
            }else if(abfrage_kategorie == 'Frauen'){
                zuzuege = <%=zzwz.get(i).getZuzug_frauen()%>;
            }else if(abfrage_kategorie == 'InländerInnen') {
                zuzuege = <%=zzwz.get(i).getZuzug_inlaender()%>;
            }else if(abfrage_kategorie == 'AusländerInnen') {
                zuzuege = <%=zzwz.get(i).getZuzug_auslaender()%>;
            } /* end if-else */

            breitengrad = <%=zzwz.get(i).getBreitengrad()%>;
            laengengrad = <%=zzwz.get(i).getLaengengrad()%>;

            /* Fügt die Daten des jeweils in der Schleife ausgewählten Bezirks/Bundeslandes zur Variable data hinzu, anhand derer die Punkte auf der Karte gesetzt werden */
            data.addRows([[breitengrad, laengengrad, bezirk, zuzuege ,'Zuzüge ' + abfrage_kategorie + ':' + zuzuege ]]);

            <%

            } // end for loop
            %>

            /* Einstellungen zur Darstellung der Karte von der Google-API vorgegeben), colorAxis, sizeAxis, region, height und width sind die einzigen von uns veränderten Optionen */
            var options = {
                colorAxis: {colors: ['#e7711c', '#4374e0']}, // orange to blue
                legend: 'none',
                backgroundColor: {fill:'transparent',stroke:'#FFF' ,strokeWidth:0 },
                datalessRegionColor: '#f5f5f5',
                displayMode: 'markers',
                enableRegionInteractivity: 'true',
                resolution: 'countries',
                sizeAxis: {minValue: 0, maxValue:3000,minSize:5,  maxSize: 25}, /* regelt die Größe der Marker anhand der Werte */
                region:'auto',
                keepAspectRatio: true,
                height: 1000,
                width: 1200,
                tooltip: {textStyle: {color: '#444444'}}
            };
            var chart = new   google.visualization.GeoChart(document.getElementById('visualization'));

            chart.draw(data, options);
        }

        /* Diese function wird aufgerufen wenn im Dropdown-Feld weiter unten eine Auswahl getroffen wird. Diese function navigiert somit zur gewünschten Seite.  */
        function goToNewPage()
        {
            var url = document.getElementById('list').value;
            if(url != 'none') {
                window.location = url;
            }
        }

    </script>



</head>

<body >
<center>
    <h1>Let's move!</h1>
    <img src="Zz.png" alt="Let's move" style="width:364px;height:240px;">

    <form action="servlet" method="post">
        <select id = "list" accesskey="target">
            <option value = "list.jsp" >&Uuml;bersichtsliste</option>
            <option value = "zuzuege.jsp" selected>Zuz&uuml;ge nach Linz</option>
            <option value = "wegzuege.jsp">Wegz&uuml;ge von Linz</option>
            <option value = "relation_zuzuege_wegzuege.jsp">Relation zwischen Wegz&uuml;ge und Zuz&uuml;ge</option>
        </select>
        <input type=button value="Go" onclick="goToNewPage()" />
    </form>

    <h2>Wie viele Menschen sind von anderen Gebieten nach Linz zugezogen? Diese Grafik verr&auml;t es dir!</h2>

    <div class="radio_button_field">
        <input type="radio" name="abfrage" checked="checked" onclick="reloadMap('gesamt');" >Gesamt
        <input type="radio" name="abfrage" onclick="reloadMap('Frauen');">Frauen
        <input type="radio" name="abfrage" onclick="reloadMap('Männer');">M&auml;nner
        <input type="radio" name="abfrage" onclick="reloadMap('InländerInnen');">Inl&auml;nderInnen
        <input type="radio" name="abfrage" onclick="reloadMap('AusländerInnen');">Ausl&auml;nderInnen
    </div>
    <hr />
    <div id="visualization"> <!-- Dieser Bereich stellt die Karte dar -->
</center>
</body>
</html>
