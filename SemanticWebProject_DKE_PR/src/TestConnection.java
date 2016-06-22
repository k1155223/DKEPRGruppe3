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
    private static String serviceURI =  "http://localhost:3030/bitchez/query";
    public static void main(String[] args){

        System.out.println("test");

        Query query = QueryFactory.create(
                "SELECT ?subject ?predicate ?object " +
                        "WHERE { " +
                        "  ?subject ?predicate ?object " +
                        "} ");
        QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query);
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
            System.out.println(resultlist.get(i).get("subject"));
        }


        /*
        try {
            CreateRDF.create();
        } catch (Exception e) {
            e.printStackTrace();
        } */
    }
}
