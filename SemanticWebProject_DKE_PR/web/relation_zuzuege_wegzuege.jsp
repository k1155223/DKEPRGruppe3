<%@ page import="org.apache.jena.query.*"
         import="java.lang.String"
         import="Zuzuege_Wegzuzege.*"
         import="TripleStore.*"
         import="java.util.ArrayList"
%>
<%@ page import="TripleStore.CreateRDF" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>Relation WZ zu ZZ</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>

    <script type='text/javascript'>

            google.load('visualization', '1', {'packages': ['geochart']});
            google.setOnLoadCallback(drawVisualization);

            function drawVisualization() {var data = new google.visualization.DataTable();

                data.addColumn('number', 'LATITUDE');
                data.addColumn('number', 'LONGITUDE');
                data.addColumn('string', 'DESCRIPTION');
                data.addColumn('number', 'Value:', 'value');
                data.addColumn({type:'string', role:'tooltip'});

                var bezirk;
                var relation_wegzuege_zuzuege;
                var breitengrad;
                var laengengrad;


                <%
                ZuzuegeWegzuege zuzuege_wegzuege = new ZuzuegeWegzuege();
                ArrayList<zuzug_wegzug_eintrag> zzwz = zuzuege_wegzuege.getZuzuegeWegzuege();

                for(int i = 0; i < zzwz.size(); i++ ){

                    int zuzuege = zzwz.get(i).getZuzuegeSumme();
                    int wegzuege = zzwz.get(i).getWegzuegeSumme();
                    int wz_abzueglich_zz = zuzuege - wegzuege;

                %>

                bezirk = "<%=zzwz.get(i).getBezirk()%>";
                relation_wegzuege_zuzuege = <%=wz_abzueglich_zz %>;
                breitengrad = <%=zzwz.get(i).getBreitengrad()%>;
                laengengrad = <%=zzwz.get(i).getLaengengrad()%>;


                data.addRows([[breitengrad, laengengrad, bezirk, relation_wegzuege_zuzuege ,'Wegzüge von Linz abzüglich Zuzüge nach Linz: ' + relation_wegzuege_zuzuege ]]);

                <%

                } // end for loop
                %>

                var options = {
                    colorAxis: {colors: ['#FF8866', '#44FF47']},
                    legend: 'none',
                    backgroundColor: {fill:'transparent',stroke:'#FFF' ,strokeWidth:0 },
                    datalessRegionColor: '#f5f5f5',
                    displayMode: 'markers',
                    enableRegionInteractivity: 'true',
                    resolution: 'countries',
                    /* sizeAxis: {minValue: 1, maxValue:1,minSize:5,  maxSize: 5}, */
                    sizeAxis: { minValue: 1, maxValue: 100},
                    region:'auto',
                    keepAspectRatio: true,
                    height: 800,
                    width: 900,
                    tooltip: {textStyle: {color: '#444444'}}
                };
                var chart = new   google.visualization.GeoChart(document.getElementById('visualization'));

                chart.draw(data, options);
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

        </form>
    </font>

    <h2>Diese Grafik zeigt die bereinigte Zuwanderung von Linz aus an. Hierbei werden die Zuzüge nach Linz von den Wegzügen von Linz abgezogen. </h2>

    <div id="visualization"> </div>

</center>


</body>

</html>
