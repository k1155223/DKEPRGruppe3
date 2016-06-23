package converter;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

//Endformat:
//Region: ZZ M�nner, ZZ Frauen, ZZ Inl�nder, ZZ Ausl�nder, WZ M�nner, WZ Frauen, WZ IL, WZ AL, Lat, Long

public class Converter {
	File zuzug;  
	File wegzug;  
	File koords;
	
	
	public Converter(File zuzug, File wegzug, File koords){
		this.zuzug = zuzug;
		this.wegzug = wegzug;
		this.koords = koords;
	}

	public void load(){

	}

	public static void main(String[] args) throws IOException {
		Converter c = new Converter(new File("src/zuzug_2014.csv"), new File("src/wegzug_2014.csv"), new File("src/koordinaten.csv"));
	//	Map<String, String[]> data = convert(c);
		
//		for(Entry<String, String[]> e : data.entrySet()){
//			System.out.print(e.getKey()+": ");
//			for(String v : e.getValue()){
//				System.out.print(v+", ");
//			}
//			System.out.println();
//		}
	
	}

	public Map<String, String[]> convert() throws FileNotFoundException, IOException {
		
		/*BufferedReader br = new BufferedReader(new FileReader(this.getZuzug()));
		BufferedReader br2 = new BufferedReader(new FileReader(this.getWegzug()));
		BufferedReader br3 = new BufferedReader(new FileReader(this.getKoords()));*/

		FileInputStream fis = new FileInputStream(this.getZuzug());
		BufferedReader br = new BufferedReader(new InputStreamReader(fis, "Cp1252"));
		FileInputStream fis2 = new FileInputStream(this.getZuzug());
		BufferedReader br2 = new BufferedReader(new InputStreamReader(fis2, "Cp1252"));
		FileInputStream fis3 = new FileInputStream(this.getZuzug());
		BufferedReader br3 = new BufferedReader(new InputStreamReader(fis3, "Cp1252"));

		//skip headings
		br.readLine();
		br2.readLine();
		br3.readLine();
		
		Map<String, String[]> data = new HashMap<String, String[]>();
		//wegz�ge
		putValues(br3, data);
		
		//zuzug�e
		putValues(br2, data);
		
		//koords
		putValues(br,data);
		return data;
	}

	private static List<String> readAndSplit(String line) {
		List<String> value = new LinkedList<String>();
		for(String t : line.split(";")){
			value.add(t);
		}
		return value;
	}
	
	private static void putValues(BufferedReader br, Map<String, String[]> data) throws IOException{
		String s;
		while((s = br.readLine()) != null){
			List<String> value = readAndSplit(s);
			String key = value.get(0);
			key = key.replace("Zuzüge ", "");
			key = key.replace("Wegzüge ", "");
			key = key.replace("ü", "ue");
			key = key.replace("ä", "ae");
			key = key.replace("ö", "oe");
//			key = key.replace("\u00fc", "ue");
//			key = key.replace("\u00e4", "ae");
//			key = key.replace("\u00f6", "oe");

			value.remove(0);

			if(data.get(key) != null){
				for(String t : data.get(key)){
					value.add(t);
				}
			}
			data.put(key, value.toArray(new String[0]));
		}
		
	}
	

	public File getKoords() {
		return koords;
	}

	public void setKoords(File koords) {
		this.koords = koords;
	}

	public File getZuzug() {
		return zuzug;
	}

	public void setZuzug(File zuzug) {
		this.zuzug = zuzug;
	}

	public File getWegzug() {
		return wegzug;
	}

	public void setWegzug(File wegzug) {
		this.wegzug = wegzug;
	}
	

}
