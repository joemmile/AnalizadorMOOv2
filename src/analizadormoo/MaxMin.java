/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadormoo;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author Alx
 */
public class MaxMin {

    public static void extremos(double maximos[], double minimos[]) {
        for (int x = 0; x < AnalizadorMO.objetivos; x++) {
            maximos[x] = Double.NEGATIVE_INFINITY;
            minimos[x] = Double.POSITIVE_INFINITY;
        }

        for (int x = 0; x < AnalizadorMO.frente_real.size(); x++) {
            for (int j = 0; j < AnalizadorMO.objetivos; j++) {
                if (minimos[j] > AnalizadorMO.frente_real.get(x)[j]) {
                    minimos[j] = AnalizadorMO.frente_real.get(x)[j];
                }
                if (maximos[j] < AnalizadorMO.frente_real.get(x)[j]) {
                    maximos[j] = AnalizadorMO.frente_real.get(x)[j];
                }
            }
        }
                for (int x = 0; x < AnalizadorMO.algoritmos; x++) {
            for (int j = 0; j < AnalizadorMO.iteraciones; j++) {
                for (int w = 0; w < AnalizadorMO.datos.get(x).get(j).size(); w++) {
                    for (int z = 0; z < AnalizadorMO.objetivos; z++) {

                        if (minimos[z] > AnalizadorMO.datos.get(x).get(j).get(w)[z]) {
                            minimos[z] = AnalizadorMO.datos.get(x).get(j).get(w)[z];
                        }

                        if (maximos[z] < AnalizadorMO.datos.get(x).get(j).get(w)[z]) {
                            maximos[z] = AnalizadorMO.datos.get(x).get(j).get(w)[z];
                        }

                    }
                }
            }
        }
    }
    public static void normaliza(double maximos[], double minimos[]) {
        //ahora tocaria normalizar con estos todos los datos LOOOL !!!
        //normaliza frente real
        for (int x = 0; x < AnalizadorMO.frente_real.size(); x++) {
            for (int j = 0; j < AnalizadorMO.objetivos; j++) {
                double value = 0;
                if (maximos[j] != minimos[j]) {
                    value = AnalizadorMO.frente_real.get(x)[j];
                    value = (value - minimos[j]) / (maximos[j] - minimos[j]);
                }
                AnalizadorMO.frente_real.get(x)[j] = value;
            }
        }
        //normaliza los datos de los algoritmos
        for (int x = 0; x < AnalizadorMO.algoritmos; x++) {
            for (int j = 0; j < AnalizadorMO.iteraciones; j++) {
                for (int w = 0; w < AnalizadorMO.datos.get(x).get(j).size(); w++) {
                    for (int z = 0; z < AnalizadorMO.objetivos; z++) {
                        double value = 0;
                        if (maximos[z] != minimos[z]) {
                            value = AnalizadorMO.datos.get(x).get(j).get(w)[z];
                            value = (value - minimos[z]) / (maximos[z] - minimos[z]);
                        }
                        AnalizadorMO.datos.get(x).get(j).get(w)[z] = value;
                        // double value = AnalizadorMO.datos.get(x).get(j).get(w)[z];
                        // value = (value - minimos[z]) / (maximos[z] - minimos[z]);
                        // AnalizadorMO.datos.get(x).get(j).get(w)[z] = value;
                    }
                }
            }
        }
    }
}
