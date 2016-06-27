package Zuzuege_Wegzuzege;
import org.apache.jena.query.*;
import java.util.ArrayList;
/**
 * Created by Christian Kolb on 25.06.2016.
 */
public class ZuzuegeWegzuege {

    private static String serviceURI =  "http://localhost:3030/ds/query";

    /*
        Die SPARQL-Query wird mit dem Konstruktor aufgerufen.
        Daher muss in jeder .JSP-Seite, in der die Abfrage_Ergebnisse ausgelesen werden sollen, mittels new ZuzuegeWegzuege eine neu Instanz dieser Klasse erzeugt werden.
        ArrayList<QuerySolution> rl = resultlist in welcher wir die einzelnen Zeilen des Query-Ergebnises speichern.
        Das Ergebnis der Query wird zunächst als ResulSet-Objekt gespeichert (nicht zu verwechseln mit dem Java-JDBC ResultSet).
        Durch den Befehl  rl = (ArrayList<QuerySolution>) ResultSetFormatter.toList(results); speichern wir das ResultSet als Liste.
        Diese  Liste besteht aus Objekten des Datentyps QuerySolution.
        In QuerySolution-Objekten sind die einzelne Werte (Längengrad, Zuzüge Männer, Wegzüge Frauen usw.) als Objekte des Typs RDFNode abgespeichert.
        Aus dem Datentyp RDFNode lässt sich die Methode toString anwenden, damit ist der Wert als String verfügbar.
        RDFNodes, welche Koordinaten beinhalten, werden weiters mittels, hier anhand des Breitegrades, des Befehls Double.parseDouble(rl.get(i).get("BG").toString()); als Double gespeichert.
        Für die Zuzugs- und Wegzugs-Werte werden die RDFNodes zu Integer-Werten umgewandelt.
        Damit sind alle Werte dann fertig für die Übergabe an den zuzug_wegzug_Konstruktor.
        In einem zuzug_wegzug_eintrags-Objekt sind alle Daten eines Bezirks/Bundeslandes gespeichert (Bezriks-Name bzw. Bundeslandes-Name, Zuzugs- und Wegzugs-Werte und Koordinaten).
        Auf all diese zuzuege_wegzuege_eintrags-Objekte lässt sich mittels  getZuzuegeWegzuege() zugreifen, welche die ArrayList mit eben jenen Einträgen zurückgibt.
    */
    ArrayList<QuerySolution> rl;
    ArrayList<zuzug_wegzug_eintrag> zuzuege_wegzuege = new ArrayList<>();

    String bezirk;
    int zuzug_maenner, zuzug_frauen, zuzug_inlaender, zuzug_auslaender;
    int wegzug_maenner, wegzug_frauen, wegzug_inlaender, wegzug_auslaender;
    double breitengrad, laengengrad;

    Query query_zuzuege_wegzuege = QueryFactory.create(
            "PREFIX rdf: <http://www.dke.at/bezirk/>" +
                    "PREFIX rdf2: <http://www.dke.at/location/>" +

                    "SELECT ?Bezirk ?Zuzuege_M ?Zuzuege_W ?Zuzuege_I ?Zuzuege_A ?Wegzuege_M ?Wegzuege_W ?Wegzuege_I ?Wegzuege_A ?BG ?LG " +
                    "WHERE {" +
                    "?x rdf:hatName ?Bezirk." +
                    "?x rdf:zuzuege_M ?Zuzuege_M." +
                    "?x rdf:zuzuege_W ?Zuzuege_W." +
                    "?x rdf:zuzuege_I ?Zuzuege_I." +
                    "?x rdf:zuzuege_A ?Zuzuege_A." +
                    "?x rdf:wegzuege_M ?Wegzuege_M." +
                    "?x rdf:wegzuege_W ?Wegzuege_W." +
                    "?x rdf:wegzuege_I ?Wegzuege_I." +
                    "?x rdf:wegzuege_A ?Wegzuege_A." +
                    "?x rdf:hatLocation ?y." +
                    "?y rdf2:hatBreitengrad ?BG." +
                    "?y rdf2:hatLaengengrad ?LG. }");


    public ZuzuegeWegzuege() {
        QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query_zuzuege_wegzuege);
        ResultSet results = q.execSelect(); // get result-set
        rl = (ArrayList<QuerySolution>) ResultSetFormatter.toList(results);

        for (int i = 0; i < rl.size(); i++) {

            /* Die Varialen in der QuerySolution-Objekte sind vom Datentyp RDFNode und werden zunächst als String umgewandelt.
               Danach lassen sie sich in das gewünschte Format (Int, Double) konvertieren, bis auf die Variable Bezirk, welche
               bereits als String sich im gewünschten Format befindet.
             */
            bezirk = rl.get(i).get("Bezirk").toString();
            zuzug_maenner = Integer.parseInt(rl.get(i).get("Zuzuege_M").toString());
            zuzug_frauen = Integer.parseInt(rl.get(i).get("Zuzuege_W").toString());
            zuzug_inlaender = Integer.parseInt(rl.get(i).get("Zuzuege_I").toString());
            zuzug_auslaender = Integer.parseInt(rl.get(i).get("Zuzuege_A").toString());
            wegzug_maenner = Integer.parseInt(rl.get(i).get("Wegzuege_M").toString());
            wegzug_frauen = Integer.parseInt(rl.get(i).get("Wegzuege_W").toString());
            wegzug_inlaender = Integer.parseInt(rl.get(i).get("Wegzuege_I").toString());
            wegzug_auslaender = Integer.parseInt(rl.get(i).get("Wegzuege_A").toString());

            // breitengrad = 0; // da null pointer exception in der Abfrage

            if(rl.get(i).get("BG") != null && rl.get(i).get("LG") != null){
                breitengrad = Double.parseDouble(rl.get(i).get("BG").toString());
                laengengrad = Double.parseDouble(rl.get(i).get("LG").toString());

                zuzuege_wegzuege.add(new zuzug_wegzug_eintrag( bezirk, zuzug_maenner, zuzug_frauen, zuzug_inlaender, zuzug_auslaender, wegzug_maenner, wegzug_frauen, wegzug_inlaender, wegzug_auslaender, breitengrad, laengengrad ));

            }else
            {
                // Keine Aktion ausführen denn Einträge ohne Koordinaten stellen nur Gesamtsummen dar und keine Bezirke bzw.Bundeslaender
            }


        } // end for loop

    } // end constructor ZuzuegeWegzuege

    public ArrayList<zuzug_wegzug_eintrag> getZuzuegeWegzuege() {
        return zuzuege_wegzuege;
    }


} // end class ZuzuegeWegZuege

