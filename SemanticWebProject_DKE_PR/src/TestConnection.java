import org.apache.jena.query.Dataset;
import org.apache.jena.query.DatasetAccessor;
import org.apache.jena.query.*;

/**
 * Created by Florian on 19/05/16.
 */


public class TestConnection {
    private static String serviceURI =  "http://localhost:3030/ds/query";
    public static void main(String[] args){

        Query query = QueryFactory.create(
                "SELECT ?subject ?predicate ?object " +
                        "WHERE { " +
                        "  ?subject ?predicate ?object " +
                        "} ");
        QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query);
        ResultSet results = q.execSelect(); // get result-set
        ResultSetFormatter.out(System.out, results); // print results
        System.out.println("babsi_test");
    }
}
