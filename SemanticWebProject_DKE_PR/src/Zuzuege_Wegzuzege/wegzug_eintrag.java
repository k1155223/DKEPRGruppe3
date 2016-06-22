package Zuzuege_Wegzuzege;

/**
 * Created by Christian Kolb on 21.06.2016.
 */
public class wegzug_eintrag {

    String bezirk;
    int wegzug_maenner, wegzug_frauen, wegzug_inlaender, wegzug_auslaender;
    double breitengrad, laengengrad;

    public wegzug_eintrag(String bezirk, int wegzug_maenner, int wegzug_frauen, int wegzug_inlaender, int wegzug_auslaender, double breitengrad, double laengengrad)
    {
        this.bezirk = bezirk;
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
} // end class wegzug_eintrag

