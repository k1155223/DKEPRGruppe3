import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

//Endformat:
//Region: ZZ MÄnner, ZZ Frauen, ZZ Inländer, ZZ Ausländer, WZ Männer, WZ Frauen, WZ IL, WZ AL, Lat, Long

public class converter {
	File zuzug;  
	File wegzug;  
	File koords;
	
	
	public converter(File zuzug, File wegzug, File koords){
		this.zuzug = zuzug;
		this.wegzug = wegzug;
		this.koords = koords;
	}
	
	public static void main(String[] args) throws IOException {
		converter c = new converter(new File("src/zuzug_2014.csv"), new File("src/wegzug_2014.csv"), new File("src/koordinaten.csv"));
		BufferedReader br = new BufferedReader(new FileReader(c.getZuzug()));
		BufferedReader br2 = new BufferedReader(new FileReader(c.getWegzug()));
		BufferedReader br3 = new BufferedReader(new FileReader(c.getKoords()));
		
		//skip headings
		br.readLine();
		br2.readLine();
		br3.readLine();
		
		Map<String, String[]> data = new HashMap<String, String[]>();
		//wegzüge
		putValues(br3, data);
		
		//zuzugüe
		putValues(br2, data);
		
		//koords
		putValues(br,data);
		
		
		
		for(Entry<String, String[]> e : data.entrySet()){
			System.out.print(e.getKey()+": ");
			for(String v : e.getValue()){
				System.out.print(v+", ");
			}
			System.out.println();
		}
	
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
