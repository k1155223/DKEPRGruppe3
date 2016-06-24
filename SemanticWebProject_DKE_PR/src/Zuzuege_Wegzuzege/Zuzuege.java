package Zuzuege_Wegzuzege;
import org.apache.jena.query.*;
import java.util.ArrayList;


/**
 * Created by Christian Kolb on 22.06.2016.
 */
public class Zuzuege {

    private static String serviceURI =  "http://localhost:3030/ds/query";
    ArrayList<QuerySolution> rl; // resultlist
    ArrayList<zuzug_eintrag> zuzuege = new ArrayList<>();

    String bezirk;
    int zuzug_maenner, zuzug_frauen, zuzug_inlaender, zuzug_auslaender;
    double breitengrad, laengengrad;

    Query query_zuzuege = QueryFactory.create(
            "PREFIX rdf: <http://www.dke.at/bezirk/>" +
                    "PREFIX rdf2: <http://www.dke.at/location/>" +

                    "SELECT ?Bezirk ?Zuzuege_M ?Zuzuege_W ?Zuzuege_I ?Zuzuege_A ?LG ?BG" +
                    "WHERE {" +
                    "?x rdf:hatName ?Bezirk." +
                    "?x rdf:zuzuege_M ?Zuzuege_M." +
                    "?x rdf:zuzuege_W ?Zuzuege_W." +
                    "?x rdf:zuzuege_I ?Zuzuege_I." +
                    "?x rdf:zuzuege_A ?Zuzuege_A." +
                    "?x rdf:hatLocation ?y." +
                    "?y rdf2:hatLaengengrad ?LG." +
                    "?y rdf2:hatBreitengrad ?BG. }");


    public Zuzuege() {
        QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query_zuzuege);
        ResultSet results = q.execSelect(); // get result-set
        rl = (ArrayList<QuerySolution>) ResultSetFormatter.toList(results);

        for (int i = 0; i < rl.size(); i++) {

            bezirk = rl.get(i).get("Zuzuege_M").toString();
            zuzug_maenner = Integer.parseInt(rl.get(i).get("Zuzuege_M").toString());
            zuzug_frauen = Integer.parseInt(rl.get(i).get("Zuzuege_W").toString());
            zuzug_inlaender = Integer.parseInt(rl.get(i).get("Zuzuege_I").toString());
            zuzug_auslaender = Integer.parseInt(rl.get(i).get("Zuzuege_I").toString());
            laengengrad =  Double.parseDouble(rl.get(i).get("Laengengrad").toString());
            breitengrad =  Double.parseDouble(rl.get(i).get("Breitengrad").toString());

            zuzuege.add(new zuzug_eintrag( bezirk, zuzug_maenner, zuzug_frauen, zuzug_inlaender, zuzug_auslaender, laengengrad, breitengrad ));

        }

    } // end constructor Zuzuege

    public ArrayList<zuzug_eintrag> getZuzuege() {
        return zuzuege;
    }


} // end class Zuzuege
