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

        ZuzuegeWegzuege zuzuege_wegzuege_liste = new ZuzuegeWegzuege();
        ArrayList<zuzug_wegzug_eintrag> zzwz = zuzuege_wegzuege_liste.getZuzuegeWegzuege();

        for(int i = 0; i < zzwz.size(); i++ ){

            System.out.println(zzwz.get(i).getBezirk() + " Zuzug gesamt: " + zzwz.get(i).getZuzuegeSumme() + " Wegzug gesamt: " + zzwz.get(i).getWegzuegeSumme() + " Breitengrad " + zzwz.get(i).getBreitengrad() + " Laengengrad " + zzwz.get(i).getLaengengrad());

        }

    }
}
