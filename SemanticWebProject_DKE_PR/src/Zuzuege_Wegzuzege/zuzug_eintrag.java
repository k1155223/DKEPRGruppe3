package Zuzuege_Wegzuzege;
import org.apache.jena.query.*;
import java.util.ArrayList;

/**
 * Created by Christian Kolb on 21.06.2016.
 */
public class zuzug_eintrag {

    String bezirk;
    int zuzug_maenner, zuzug_frauen, zuzug_inlaender, zuzug_auslaender;
    double breitengrad, laengengrad;

    public zuzug_eintrag(String bezirk, int zuzug_maenner, int zuzug_frauen, int zuzug_inlaender, int zuzug_auslaender, double breitengrad, double laengengrad)
    {
        this.bezirk = bezirk;
        this.zuzug_maenner = zuzug_maenner;
        this.zuzug_frauen = zuzug_frauen;
        this.zuzug_inlaender = zuzug_inlaender;
        this.zuzug_auslaender = zuzug_auslaender;
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

} // end class zuzug_eintrag

