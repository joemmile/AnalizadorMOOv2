/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadormo;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author Alx
 */
public class EscrituraArchivo {
    public static void Escribe_Archivo(ArrayList <Double> Indicador,String nombre) throws FileNotFoundException, IOException
    {
        //mdkir problema!!
        File directorio = new File("data/"+AnalizadorMO.problema);
        directorio.mkdirs();
        FileOutputStream fos=new FileOutputStream("data/"+AnalizadorMO.problema+"/"+nombre);
        PrintStream ps=new PrintStream(fos);
        for(int x=0;x<Indicador.size();x++)
        {
            ps.println(Indicador.get(x));
        }
        ps.close();
        fos.close();

    }
    
    public static void Escribe_Best_FUN_MAX(ArrayList <Double> Indicador, ArrayList <ArrayList<double[]>> datos,String nombre) throws FileNotFoundException, IOException{
    double mejor=Indicador.get(0);
    int mejor_pos=0;
    for(int x=0;x<Indicador.size();x++)
    {
        if(Indicador.get(x)>mejor)
        {
            mejor=Indicador.get(x);
            mejor_pos=x;
        }
    }
    
        //mdkir problema!!
        File directorio = new File("data/"+AnalizadorMO.problema);
        directorio.mkdirs();
        FileOutputStream fos=new FileOutputStream("data/"+AnalizadorMO.problema+"/"+nombre);
        PrintStream ps=new PrintStream(fos);
        
            for(int j=0;j<datos.get(mejor_pos).size();j++)//soluciones en el frente 
            {
                for(int w=0;w<datos.get(mejor_pos).get(j).length;w++)//objetivos
                ps.print(datos.get(mejor_pos).get(j)[w]+" ");
                ps.println();
            }
        ps.close();
        fos.close();
        
        
    }
    
    public static void Escribe_Best_FUN_MIN(ArrayList <Double> Indicador, ArrayList <ArrayList<double[]>> datos,String nombre) throws FileNotFoundException, IOException{
    double mejor=Indicador.get(0);
    int mejor_pos=0;
    for(int x=0;x<Indicador.size();x++)
    {
        if(Indicador.get(x)<mejor)
        {
            mejor=Indicador.get(x);
            mejor_pos=x;
        }
    }
    
        //mdkir problema!!
        File directorio = new File("data/"+AnalizadorMO.problema);
        directorio.mkdirs();
        FileOutputStream fos=new FileOutputStream("data/"+AnalizadorMO.problema+"/"+nombre);
        PrintStream ps=new PrintStream(fos);
 
            for(int j=0;j<datos.get(mejor_pos).size();j++)//soluciones en el frente 
            {
                for(int w=0;w<datos.get(mejor_pos).get(j).length;w++)//objetivos
                ps.print(datos.get(mejor_pos).get(j)[w]+" ");
                ps.println();
            }
        ps.close();
        fos.close();
        
        
    }

}
