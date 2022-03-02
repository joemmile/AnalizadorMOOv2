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

        /*
        for(int x=0;x<AnalizadorMO.algoritmos;x++)
        {
            for(int j=0;j<AnalizadorMO.iteraciones;j++)
            {
                  for(int w=0;w<AnalizadorMO.datos.get(x).get(j).size();w++)
                  {
                      
                      for(int z=0;z<AnalizadorMO.objetivos;z++)
                      {

                          if(minimos[z]>AnalizadorMO.datos.get(x).get(j).get(w)[z])
                          {
                              minimos[z]=AnalizadorMO.datos.get(x).get(j).get(w)[z];
                          }
                          
                          if(maximos[z]<AnalizadorMO.datos.get(x).get(j).get(w)[z])
                          {
                              maximos[z]=AnalizadorMO.datos.get(x).get(j).get(w)[z];
                          }
                          

                      }

                  }
            }
        }*/
    }

    public static void normaliza_maxmin(double maximos[], double minimos[]) {
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

    public static void normaliza_media(double promedios[]) {
        //ahora tocaria normalizar
        //normaliza frente real
        for (int i = 0; i < AnalizadorMO.frente_real.size(); i++) {
            for (int x = 0; x < AnalizadorMO.objetivos; x++) {
                double acumulado = 0, media = 0, acumulado_total = 0, desvstd = 0, value = 0;
                for (int j = 0; j < AnalizadorMO.frente_real.size(); j++) {
                    acumulado += AnalizadorMO.frente_real.get(j)[x];
                }
                media = acumulado / (double) AnalizadorMO.frente_real.size();
                for (int j = 0; j < AnalizadorMO.frente_real.size(); j++) {
                    acumulado_total += Math.pow(AnalizadorMO.frente_real.get(j)[x] - media, 2);
                }
                desvstd = Math.sqrt((acumulado_total) / (AnalizadorMO.frente_real.size() - 1));

                value = (AnalizadorMO.frente_real.get(i)[x] - media) / (desvstd);
                AnalizadorMO.frente_real.get(i)[x] = value;
            }
        }

        //normaliza los datos de los algoritmos
        for (int x = 0; x < AnalizadorMO.algoritmos; x++) {
            for (int j = 0; j < AnalizadorMO.iteraciones; j++) {
                for (int w = 0; w < AnalizadorMO.datos.get(x).get(j).size(); w++) {
                    for (int z = 0; z < AnalizadorMO.objetivos; z++) {
                        double acumulado = 0, media = 0, acumulado_total = 0, desvstd = 0, value = 0;
                        for (int i = 0; i < AnalizadorMO.datos.get(x).get(j).size(); i++) {
                            acumulado += AnalizadorMO.datos.get(x).get(j).get(i)[z];
                        }
                        media = acumulado / (double) AnalizadorMO.datos.get(x).get(j).size();
                        for (int i = 0; i < AnalizadorMO.datos.get(x).get(j).size(); i++) {
                            acumulado_total += Math.pow(AnalizadorMO.datos.get(x).get(j).get(i)[z] - media, 2);
                        }
                        desvstd = Math.sqrt((acumulado_total) / (AnalizadorMO.frente_real.size() - 1));

                        value = (AnalizadorMO.datos.get(x).get(j).get(w)[z] - media) / (desvstd);
                        AnalizadorMO.datos.get(x).get(j).get(w)[z] = value;
                    }
                }
            }
        }
    }
}
