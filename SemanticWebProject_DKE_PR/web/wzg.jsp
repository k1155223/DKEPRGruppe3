

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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


<title>Our Semantic App</title>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>

      <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdIsSVZAwwVk4q-9qdyISziJQKus03B1M&callback=initMap">
  </script>

    <script type='text/javascript'>

   google.charts.load('current', {'packages': ['geochart']});
   google.charts.setOnLoadCallback(drawMap);


    function drawMap() {
      
      

            
      var dataB = google.visualization.DataTable();
        dataB.addColumn('string', 'City');
        dataB.addColumn('number', 'Wegz�ge Gesamt');
         <%
            ZuzuegeWegzuege wegzuegeliste = new ZuzuegeWegzuege();
            ArrayList<zuzug_wegzug_eintrag> wz = wegzuegeliste.getZuzuegeWegzuege();
            for(int i = 0; i < wz.size(); i++ ){
            %>
            var bezirk = "<%=wz.get(i).getBezirk()%>";
            var wegzuege_gesamt = <%=wz.get(i).getWegzug_frauen()+wz.get(i).getWegzug_maenner()%>;
           
            data.addRows([ [bezirk,  {v: wegzuege_gesamt, f: String(wegzuege_gesamt)}] ] );
            <%
              }
            %>

      var options = {};
      options['region'] = 'AT';
      
      options['displayMode'] = 'markers';
      colorAxis: {colors: ['green', 'blue']}


    
      
      var containerB = document.getElementById('map_canvasB');
      var geomapB = new google.visualization.GeoChart(containerB);
     
      geomapB.draw(dataB, options);
    
    
    };
    
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
              <option value = "map.jsp" >Map</option>
               <option value = "wzg.jsp" >Wegz�ge Gesamt</option>
               <option value = "zzg.jsp" >Zuz�ge Gesamt</option>
               <option value = "list.jsp" >Liste</option>
                <option value = "zuzuege.jsp">Zuzuege mit Marker</option>
               </select>
             <input type=button value="Go" onclick="goToNewPage()" />
	</form>
	<h4>Wegz�ge Gesamt</h4>
	</font>
	
	 
	 <div id='map_canvasB' style="width: 900px; height: 500px;"></div>
</center>

   
</body>

</html>