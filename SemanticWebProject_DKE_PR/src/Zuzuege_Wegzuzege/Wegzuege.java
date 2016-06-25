package Zuzuege_Wegzuzege;
        import java.util.ArrayList;

/**
 * Created by Walcherhof on 22.06.2016.
 */
class Wegzuege {

    ArrayList<wegzug_eintrag> wegzuege = new ArrayList<>();


    Wegzuege() {
        wegzuege.add(new wegzug_eintrag("Steyr", 51, 51, 84, 18, 7.887778, 14.550278));
        wegzuege.add(new wegzug_eintrag("Voecklabruck", 94, 83, 138, 39, 48.008611, 13.655833));
    } // end constructor Zuzuege

    public ArrayList<wegzug_eintrag> getWegzuege() {
        return wegzuege;
    }

} // end class Wegzuege
