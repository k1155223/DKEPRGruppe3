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


<title>&Uuml;bersichtskarte</title>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
  <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdIsSVZAwwVk4q-9qdyISziJQKus03B1M&callback=initMap">
    </script>
  <script type='text/javascript'>
   google.charts.load('current', {'packages': ['map']});
   google.charts.setOnLoadCallback(drawMap);

var zz = new Array(1,2,3,4,5,6,7,8,9,10,11 );
   function drawMap() {
      var data = google.visualization.arrayToDataTable([
        ['Lat', 'Long', 'Zuz�ge'],
          [48.037222, 14.416944,'ZuZ�ge: ' +zz[0]+'\n Wegz�ge: ' +400],//Steyr
          [48.1575, 14.026667,'ZuZ�ge: '+ zz[1]+'\n Wegz�ge: ' +1120],//Wels
          [48.2575, 13.033889, 'ZuZ�ge: '+zz[2]+'\n Wegz�ge: ' +190],//Braunau am Inn
          [48.316667, 14.033333, 'ZuZ�ge: '+zz[3] +'\n Wegz�ge: ' +12],//Eferding
          [48.511667, 14.506111,'ZuZ�ge: ' +zz[4]+'\n Wegz�ge: ' +400],//Freistadt
          [47.91805,13.799444,'ZuZ�ge: '+ zz[5]+'\n Wegz�ge: ' +1120],//Gmunden
          [48.235,13.831944, 'ZuZ�ge: '+zz[6]+'\n Wegz�ge: ' +190],//Grieskirchen
          [47.905,14.121944, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Kirchdorf an der Krems
          [48.160139,14.339722, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//   Linz-Land;
[48.250278,14.633611, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Perg;
[48.21,13.489444 , 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Ried im Innkreis;48.21;13.489444 
[48.573333,13.991667, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Rohrbach;48.573333;13.991667
[48.456944,13.431667, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Sch�rding;48.456944;13.431667
[47.887778,14.550278, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Steyr-Land;7.887778;14.550278
[48.459444,14.290833, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Urfahr-Umgebung;48.459444;14.290833
[48.008611,13.655833, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//V�cklabruck;48.008611;13.655833
[48.078611,13.958333, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Wels-Land;48.078611;13.958333 
[47.845556,16.518889, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Burgenland;47.845556;16.518889
[46.617778,14.305556, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//K�rnten;46.617778;14.305556
[48.204722,15.62666 , 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Nieder�sterreich;48.204722;15.62666 
[47.8,13.033333, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Salzburg;47.8;13.033333
[48.209722,16.37, 'ZuZ�ge: '+zz[7] +'\n Wegz�ge: ' +812],//Wien;48.209722;16.37
          [47.066667,15.433333, 'ZuZ�ge: '+zz[8] +'\n Wegz�ge: ' +932],//Steiermark
          [47.267222,11.392778, 'ZuZ�ge: '+zz[9] +'\n Wegz�ge: ' +1672],//Tirol
          [47.505,9.749167, 'ZuZ�ge: '+zz[10] +'\n Wegz�ge: ' +123]//Vorarlberg
       
      ]);
        
      
    

      var options = {showTip: true};
      options['region'] = 'AT';
      options['colors'] = [0xFF8747, 0xFFB581, 0xc06000]; //orange colors
      options['dataMode'] = 'markers';

      var container = document.getElementById('map_canvas');
      var geomap = new google.visualization.Map(container);
      geomap.draw(data, options);
      
    
    
    
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
                <option value = "map.jsp" >&Uuml;bersichtskarte</option>
                <option value = "list.jsp" >&Uuml;bersichtsliste</option>
                <option value = "zuzuege.jsp">Zuz&uuml;ge</option>
                <option value = "wegzuege.jsp">Wegzuege</option>
                <option value = "relation_zuzuege_wegzuege.jsp">Relation zwischen Wegz&uuml;ge und Zuz&uuml;ge</option>
            </select>
            <input type=button value="Go" onclick="goToNewPage()" />
        </form>
	 <div id='map_canvas'></div>
	 
	 
</center>

   
</body>

</html>