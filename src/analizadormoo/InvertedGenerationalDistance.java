/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadormoo;

import java.util.ArrayList;

/**
 *
 * @author Alx
 */
public class InvertedGenerationalDistance {

    public static double Compute(ArrayList<double[]> frente_real, ArrayList<double[]> frente_aproximado) {
        //Calcula generational distance
        double distancia_min, distancia, distancia_total;
        distancia_total = 0;
        for (int x = 0; x < frente_real.size(); x++) {
            distancia_min = Double.MAX_VALUE;
            
            for (int j = 0; j < frente_aproximado.size(); j++) {
                distancia = 0;
                //System.out.println(" DISTANCIA FA"+ j+" ");
                for (int w = 0; w < frente_real.get(x).length; w++) //con cualquiera de los 2 saco el length
                {
                    //System.out.println("FR "+ frente_real.get(x)[w]);
                    //System.out.println("FA "+ frente_aproximado.get(j)[w]);
                    //System.out.println("FR-FA "+ (frente_real.get(x)[w] - frente_aproximado.get(j)[w]));
                    //System.out.println("FR-FA^2 "+ Math.pow(frente_real.get(x)[w] - frente_aproximado.get(j)[w], 2));
                    distancia += Math.pow(frente_real.get(x)[w] - frente_aproximado.get(j)[w], 2);
                }
               
                distancia = Math.sqrt(distancia);
                //System.out.println(" DISTANCIA con raiz "+ distancia+" ");
                if (distancia < distancia_min) {
                    distancia_min = distancia;
                }
            }
            distancia_total += distancia_min;
        }
        //System.out.println(" DISTANCIA TOTAL"+ distancia_total+" ");
        //System.out.println(" tamaño frente real "+ frente_real.size()+" ");
        distancia_total = distancia_total / frente_real.size();
        //distancia_total = Math.sqrt(distancia_total) / frente_real.size();
        return distancia_total;
    }

}
