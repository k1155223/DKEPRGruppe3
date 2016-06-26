package TripleStore; /**
 * Created by Florian on 22/06/16.
 */
import converter.Converter;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.DatasetAccessor;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;
import org.apache.log4j.varia.NullAppender;
import org.apache.jena.ontology.OntModel;
import org.apache.log4j.BasicConfigurator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.jena.query.*;


public class CreateRDF {
    private static String serviceURI =  "http://localhost:3030/ds/query";

    static Converter c = new Converter(new File("DKE/zuzug_2014.csv"), new File("DKE/wegzug_2014.csv"), new File("DKE/koordinaten.csv"));
    //static Converter c = new Converter(new File("src/converter/zuzug_2014.csv"), new File("src/converter/wegzug_2014.csv"), new File("src/converter/koordinaten.csv"));

    public static void create() throws Exception{
        Map<String, String[]> data = c.convert();
        
        //in RDF schreiben
        final String BASE = "http://www.dke.at/";
        BasicConfigurator.configure(new NullAppender());
        OntModel m = ModelFactory.createOntologyModel();
        // createNamespace(m, BASE);
        createDataModel(data, m, BASE);
        writeFile(m);

        //Einf�gen in Triplestore
        String serviceURI2 = "http://localhost:3030/ds/data";
        DatasetAccessorFactory factory = null;
        DatasetAccessor accessor = factory.createHTTP(serviceURI2);
        accessor.putModel(m);

    }

    private static void writeFile(OntModel m) throws IOException {
        String fileName = "data.rdf.xml";
        FileWriter out = new FileWriter( fileName );
        try {
            System.out.println("trying to write the file");
            m.write(out, "RDF/XML");
            System.out.println("writing successful (hopefully)");
        } finally {
            try {
                out.close();
            }
            catch (IOException closeException) {
                // ignore
            }
        }
    }

    private static void createDataModel(Map<String, String[]> data, OntModel m,String BASE){
        for(Entry<String, String[]> e : data.entrySet()){
            //Region: ZZ M�nner, ZZ Frauen, ZZ Inl�nder, ZZ Ausl�nder, WZ M�nner, WZ Frauen, WZ IL, WZ AL, Lat, Long
            Resource r = m.createResource("http://www.dke.at/bezirk/"+e.getKey());
            r.addProperty(m.getProperty(BASE+"bezirk/hatName"), e.getKey());
            r.addProperty(m.getProperty(BASE+"bezirk/zuzuege_M"), e.getValue()[0]);
            r.addProperty(m.getProperty(BASE+"bezirk/zuzuege_W"), e.getValue()[1]);
            r.addProperty(m.getProperty(BASE+"bezirk/zuzuege_I"), e.getValue()[2]);
            r.addProperty(m.getProperty(BASE+"bezirk/zuzuege_A"), e.getValue()[3]);
            r.addProperty(m.getProperty(BASE+"bezirk/wegzuege_M"), e.getValue()[4]);
            r.addProperty(m.getProperty(BASE+"bezirk/wegzuege_W"), e.getValue()[5]);
            r.addProperty(m.getProperty(BASE+"bezirk/wegzuege_I"), e.getValue()[6]);
            r.addProperty(m.getProperty(BASE+"bezirk/wegzuege_A"), e.getValue()[7]);

            if(e.getValue().length > 8){
                Resource r2 = m.createResource("http://www.dke.at/"+e.getKey()+"/location/");
                r2.addProperty(m.getProperty("http://www.dke.at/location/hatBreitengrad"), e.getValue()[8]);
                r2.addProperty(m.getProperty("http://www.dke.at/location/hatLaengengrad"), e.getValue()[9]);

                r.addProperty(m.getProperty("http://www.dke.at/bezirk/hatLocation"), m.getResource("http://www.dke.at/"+e.getKey()+"/location/"));
            }

        }
    }

    public String testPath(){

        URL location = this.getClass().getProtectionDomain().getCodeSource().getLocation();
        System.out.println(location.getFile());

        File f = new File("");
        return f.getAbsolutePath();
    }
}
