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


              <title>DKE PR Test2016</title>
      <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <script type='text/javascript'>

        google.charts.load('current', {'packages':['table']});
        google.charts.setOnLoadCallback(drawTable);
        function drawTable() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'City');
            data.addColumn('number', 'Wegzüge Frauen');
            data.addColumn('number', 'Wegzüge Männer');

            <%
            Wegzuege wegzuegeliste = new Wegzuege();
            ArrayList<wegzug_eintrag> wz = wegzuegeliste.getWegzuege();

            for(int i = 0; i < wz.size(); i++ ){
            %>

            var bezirk = "<%=wz.get(i).getBezirk()%>";
            var wegzuege_frauen = <%=wz.get(i).getWegzug_frauen()%>;
            var wegzuege_maenner = <%=wz.get(i).getWegzug_maenner()%>;

            data.addRows([ [bezirk,  {v: wegzuege_frauen, f: String(wegzuege_frauen)},{v: wegzuege_maenner, f:  String(wegzuege_maenner)}] ] );
            <%
              }
            %>


            var table = new google.visualization.Table(document.getElementById('table_div'));

            table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
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

        <form action="servlet" method="post">
            <select id = "list" accesskey="target">
                <option value = "zzm.html" >Zuzüge Männer</option>
                <option value = "wzm.html" >Wegzüge Männer</option>
                <option value = "zzf.html" >Zuzüge Frauen</option>
                <option value = "wzf.html" >Wegzüge Frauen</option>
                <option value = "wzf.jsp" >Wegzüge beider Geschlechter</option>
            </select>
            <input type=button value="Go" onclick="goToNewPage()" />
        </form>
    </font>



    <div id="table_div"></div>

</center>


</body>

</html>
