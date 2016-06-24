/**
 * Created by Florian on 19/05/16.
 */

    import TripleStore.CreateRDF;
    import Zuzuege_Wegzuzege.*;
    import org.apache.jena.query.*;
    import java.lang.String;
    import java.util.ArrayList;

public class TestConnection {
    private static String serviceURI =  "http://localhost:3030/ds/query";
    public static void main(String[] args){

        Zuzuege zuzuegeliste = new Zuzuege();
        ArrayList<zuzug_eintrag> zz = zuzuegeliste.getZuzuege();

        for(int i = 0; i < zz.size(); i++ ){

            System.out.println(zz.get(i).getBezirk() + " Zuzug Auslaender: " + zz.get(i).getZuzug_auslaender() + " Breitengrad " + zz.get(i).getBreitengrad() + " Laengengrad " + zz.get(i).getLaengengrad());

        }

        /*
        try {
            CreateRDF.create();
            CreateRDF c = new CreateRDF();
            c.testPath();

        } catch (Exception e) {
            e.printStackTrace();
        }

        */
    }
}
