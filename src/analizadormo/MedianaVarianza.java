/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadormo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Objects;
//import org.apache.commons.math3.stat.descriptive.DescriptiveStatistics;
/**
 *
 * @author Alx
 */
public class MedianaVarianza {
    
    
    public static double Mediana(ArrayList <Double> Indicador)
    {
        //DescriptiveStatistics stats = new DescriptiveStatistics();
        System.setProperty("java.util.Arrays.useLegacyMergeSort", "true");
        double valores[]=new double[Indicador.size()];
        for(int x=0;x<Indicador.size();x++)
            valores[x]=Indicador.get(x);
            //stats.addValue(Indicador.get(x));
        Arrays.sort(valores);
        //double mediana=stats.getPercentile(50);
        //return mediana;
        
        if(valores.length%2==0)
        return valores[valores.length/2];
        else
        return valores[valores.length/2+1];
        
    }
    
    
    public static double IQR(ArrayList <Double> Indicador)
    {
        
        double valores[]=new double[Indicador.size()];
        double Q1,Q3;
        
        //DescriptiveStatistics stats = new DescriptiveStatistics();
        for(int x=0;x<Indicador.size();x++)
            valores[x]=Indicador.get(x);
            //stats.addValue(Indicador.get(x));
        //double IQR=stats.getPercentile(75)-stats.getPercentile(25);
        //return IQR;
        Arrays.sort(valores);
        Q1=valores[(int)Math.ceil(valores.length/4)];
        Q3=valores[(int)Math.ceil((3*valores.length)/4)];
        return (Q3-Q1);
    }
    
    
}
