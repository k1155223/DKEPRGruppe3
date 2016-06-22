package Zuzuege_Wegzuzege;
import java.util.ArrayList;


/**
 * Created by Christian Kolb on 22.06.2016.
 */
public class Zuzuege {

    ArrayList<zuzug_eintrag> zuzuege = new ArrayList<>();

    public Zuzuege() {
        zuzuege.add(new zuzug_eintrag("Steyr", 67, 59, 105, 21, 7.887778, 14.550278));
        zuzuege.add(new zuzug_eintrag("Voecklabruck", 216, 181, 212, 185, 48.008611, 13.655833));
    } // end constructor Zuzuege

    public ArrayList<zuzug_eintrag> getZuzuege() {
        return zuzuege;
    }


} // end class Zuzuege
