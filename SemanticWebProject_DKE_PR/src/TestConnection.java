/**
 * Created by Florian on 19/05/16.
 */

import org.apache.jena.query.*;
import java.lang.String;
import java.util.LinkedList;
import java.util.ArrayList;
import Zuzuege_Wegzuzege.*;
import org.apache.jena.rdf.model.RDFNode;

public class TestConnection {
    private static String serviceURI =  "http://localhost:3030/ds/query";
    public static void main(String[] args){

        System.out.println("test");

        Query query = QueryFactory.create(
                "SELECT ?subject ?predicate ?object " +
                        "WHERE { " +
                        "  ?subject ?predicate ?object " +
                        "} ");

        Query query2 = QueryFactory.create(
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

        QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query2);
        ResultSet results = q.execSelect(); // get result-set

        // ResultSetFormatter.out(System.out, results); // print results

        // System.out.println(ResultSetFormatter.asXMLString(results));

        ArrayList<QuerySolution> resultlist;
        resultlist = (ArrayList<QuerySolution>) ResultSetFormatter.toList(results);

        ArrayList<String> result1 = (ArrayList) results.getResultVars();

        System.out.println("\nLoop Approach: ");
        // Traditional for loop approach
        for (int i = 0; i < result1.size(); i++) {
            System.out.println(result1.get(i));
            System.out.println(i);
        }

        System.out.println("Using for loop");
        for (int i = 0; i < resultlist.size(); i++) {
            System.out.println(resultlist.get(i).get("Zuzuege_M"));
        }

        /*try {
            CreateRDF.create();
        } catch (Exception e) {
            e.printStackTrace();
        }*/
    }
}
