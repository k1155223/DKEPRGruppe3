

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
  <script type='text/javascript'>
   google.charts.load('current', {'packages': ['geochart']});
   google.charts.setOnLoadCallback(drawMap);


    function drawMap() {
      
      

            
      var dataB = google.visualization.DataTable();
        dataB.addColumn('string', 'City');
        dataB.addColumn('number', 'Zuzüge Gesamt');
         <%
            Zuzuege zuzuegeliste = new Zuzuege();
            ArrayList<zuzug_eintrag> zz = zuzuegeliste.getZuzuege();
            for(int i = 0; i < zz.size(); i++ ){
            %>
            var bezirk = "<%=zz.get(i).getBezirk()%>";
            var zuzuege_gesamt = <%=zz.get(i).getZuzug_frauen()+zz.get(i).getZuzug_maenner()%>;
           
            data.addRows([ [bezirk,  {v: zuzuege_gesamt, f: String(zuzuege_gesamt)}] ] );
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
               <option value = "wzg.jsp" >Wegzüge Gesamt</option>
               <option value = "zzg.jsp" >Zuzüge Gesamt</option>
               <option value = "list.jsp" >Liste</option>
               </select>
             <input type=button value="Go" onclick="goToNewPage()" />
	</form>
	<h4>Zuzüge Gesamt</h4>
	</font>
	
	 
	 <div id='map_canvasB' style="width: 900px; height: 500px;"></div>
</center>

   
</body>

</html>