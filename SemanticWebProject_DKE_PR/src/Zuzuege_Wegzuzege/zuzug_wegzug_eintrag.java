package Zuzuege_Wegzuzege;

/**
 * Created by Christian Kolb on 25.06.2016.
 */
public class zuzug_wegzug_eintrag{

    private String bezirk;
    private int zuzug_maenner, zuzug_frauen, zuzug_inlaender, zuzug_auslaender;
    private int wegzug_maenner, wegzug_frauen, wegzug_inlaender, wegzug_auslaender;
    private double breitengrad, laengengrad;

    public zuzug_wegzug_eintrag(String bezirk, int zuzug_maenner, int zuzug_frauen, int zuzug_inlaender, int zuzug_auslaender, int wegzug_maenner, int wegzug_frauen, int wegzug_inlaender, int wegzug_auslaender, double breitengrad, double laengengrad)
    {
        this.bezirk = bezirk;
        this.zuzug_maenner = zuzug_maenner;
        this.zuzug_frauen = zuzug_frauen;
        this.zuzug_inlaender = zuzug_inlaender;
        this.zuzug_auslaender = zuzug_auslaender;
        this.wegzug_maenner = wegzug_maenner;
        this.wegzug_frauen = wegzug_frauen;
        this.wegzug_inlaender = wegzug_inlaender;
        this.wegzug_auslaender = wegzug_auslaender;
        this.breitengrad = breitengrad;
        this.laengengrad = laengengrad;
    }

    public String getBezirk() {
        return bezirk;
    }

    public double getBreitengrad() {
        return breitengrad;
    }

    public double getLaengengrad() {
        return laengengrad;
    }

    public int getZuzug_inlaender() {
        return zuzug_inlaender;
    }

    public int getZuzug_auslaender() {
        return zuzug_auslaender;
    }

    public int getZuzug_frauen() {
        return zuzug_frauen;
    }

    public int getZuzug_maenner() {
        return zuzug_maenner;
    }


    public int getWegzug_inlaender() {
        return wegzug_inlaender;
    }

    public int getWegzug_auslaender() {
        return wegzug_auslaender;
    }

    public int getWegzug_frauen() {
        return wegzug_frauen;
    }

    public int getWegzug_maenner() {
        return wegzug_maenner;
    }

    public int getZuzuegeSumme(){
        // Zuzug Männer + Zuzug Frauen = Zuüge gesamt da sie bereits Zuzüge Inländer und Zuzüge Ausländer beinhalten
        return (getZuzug_maenner() + getZuzug_frauen());
    }

    public int getWegzuegeSumme(){
        // Wegzug Männer + Wegzug Frauen = Wegzüge gesamt da sie bereits Wegzüge Inländer und Wegzüge Ausländer beinhalten
        return (getWegzug_maenner() + getWegzug_frauen());
    }


} // end class zuzug_eintrag

