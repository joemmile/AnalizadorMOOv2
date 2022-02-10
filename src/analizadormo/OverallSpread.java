/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadormo;

import java.util.ArrayList;

/**
 *
 * @author Alx
 * this class implements the Overall Pareto Spread in 
 * Metrics for Quality Assessment of a Multiobjective Design Optimization Solution Set
 * Jin Wu, Shapour Azarm
 */
public class OverallSpread {
    
    public static double Compute(ArrayList<double[]> frente_aproximado)
    {
        double OS=1.0;
        
        for(int x=0;x<AnalizadorMO.objetivos;x++)
        {
            double minimo=Double.MAX_VALUE;
            double maximo=0.0;
            for(int j=0;j<frente_aproximado.size();j++)
            {
                if(frente_aproximado.get(j)[x]<minimo)
                {
                    minimo=frente_aproximado.get(j)[x];
                }
                if(frente_aproximado.get(j)[x]>maximo)
                {
                    maximo=frente_aproximado.get(j)[x];
                }
            }
            
            OS*=Math.abs(maximo-minimo);
        }
        
        return OS;
    }
}
