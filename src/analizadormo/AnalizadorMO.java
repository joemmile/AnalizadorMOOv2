/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadormo;

/**
 *
 * @author Alx
 */
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;

public class AnalizadorMO {

    static ArrayList<ArrayList<ArrayList<double[]>>> datos;
    static ArrayList<ArrayList<ArrayList<double[]>>> datos_originales;
    static ArrayList<double[]> frente_real;
    static int objetivos, algoritmos, iteraciones;
    static String problema;
    static ArrayList<String> nombres_problemas;
    static ArrayList<String> nombres_algoritmos;

    public static void main(String[] args) throws IOException {
        nombres_problemas = new ArrayList();
        nombres_algoritmos = new ArrayList();
        //FileReader fr_main=new FileReader(args[0]);
        //FileReader fr_main = new FileReader("Prueba.txt");
        FileReader fr_main = new FileReader("Prueba_RSIM.txt");
        BufferedReader bf_main = new BufferedReader(fr_main);
        int contador = 0;
        //algoritmos=Integer.valueOf(args[1]);
        algoritmos = 3;
        //algoritmos = 5;

        /*nombres_algoritmos.add("Hybrid Q-Learning");
        nombres_algoritmos.add("Hybrid Sarsa");
        nombres_algoritmos.add("Hybrid Sarsa-Lambda");
        nombres_algoritmos.add("DC-NSGA-II");
        nombres_algoritmos.add("Dif Evol");*/
        nombres_algoritmos.add("MOEAD_RSIM");
        nombres_algoritmos.add("MOEAD_KLP");
        nombres_algoritmos.add("MOEAD");

        Latex.Inicializa_latex_igd();
        Latex.Inicializa_latex_GS();
        Latex.Inicializa_latex_HV();
        Latex.Inicializa_latex_Epsilon();
        Latex.Inicializa_latex_igd_plus();
        Latex.Inicializa_latex_OS();
        Estadisticos.Inicializa_scripts_R();
        while (bf_main.ready()) {
            contador++;
            StringTokenizer st_names = new StringTokenizer(bf_main.readLine());
            problema = st_names.nextToken();
            nombres_problemas.add(problema);
            System.out.println("Problema " + contador + " " + problema);
            if(problema.contains("N05-DTLZ4")){
            int i =0;
            }
            ;
            
            FileReader fr = new FileReader(st_names.nextToken());
            BufferedReader bf = new BufferedReader(fr);
            StringTokenizer st = new StringTokenizer(bf.readLine());
            algoritmos = Integer.valueOf(st.nextToken());
            iteraciones = Integer.valueOf(st.nextToken());
            objetivos = Integer.valueOf(st.nextToken());
            System.out.println("Valor objetivos " + objetivos);
            datos = new ArrayList();
            datos_originales = new ArrayList();
            frente_real = new ArrayList<>();
            FileReader fr2 = new FileReader(bf.readLine());
            BufferedReader bf2 = new BufferedReader(fr2);
            while (bf2.ready()) {
                String cadena = bf2.readLine();
                if (!cadena.isEmpty() && cadena.compareTo("") != 0) {
                    StringTokenizer st2 = new StringTokenizer(cadena);
                    double temp[] = new double[objetivos];
                    for (int x = 0; x < objetivos; x++) {
                        temp[x] = Double.parseDouble(st2.nextToken());
                    }
                    if (frente_real.isEmpty()) {
                        Comparador.agrega(frente_real, temp);
                    } else {
                        Comparador.agrega(frente_real, temp);
                    }
                }
            }
            bf2.close();
            fr2.close();

            for (int w = 0; w < algoritmos; w++) {
                ArrayList<ArrayList<double[]>> datos_alg = new ArrayList<>();
                for (int j = 0; j < iteraciones; j++) {
                    ArrayList<double[]> frente_aproximado = new ArrayList<>();
                    String archivo = bf.readLine();
                    fr2 = new FileReader(archivo);
                    bf2 = new BufferedReader(fr2);
                    System.out.println(archivo);
                    while (bf2.ready()) {
                        StringTokenizer st2 = new StringTokenizer(bf2.readLine());
                        double temp[] = new double[objetivos];
                        for (int x = 0; x < objetivos; x++) {
                            temp[x] = Double.parseDouble(st2.nextToken());
                        }
                        if (frente_aproximado.isEmpty()) {
                            Comparador.agrega(frente_aproximado, temp);
                            //Comparador.agrega(frente_real, temp);
                        } else {
                            Comparador.agrega(frente_aproximado, temp);
                            //Comparador.agrega(frente_real, temp);//linea agregada para filtrado de soluciones
                        }
                    }
                    System.out.println(Arrays.toString(frente_aproximado.get(0)));
                    bf2.close();
                    fr2.close();
                    datos_alg.add(frente_aproximado);
                }
                datos.add(datos_alg);
                ArrayList<ArrayList<double[]>> datos_alg_copy = new ArrayList<>();
                for (int x = 0; x < datos_alg.size(); x++)//copia de las iteraciones
                {
                    ArrayList<double[]> frente_aproximado = new ArrayList<>();
                    for (int j = 0; j < datos_alg.get(x).size(); j++)//copia de soluciones en el frente
                    {
                        double[] temp = new double[objetivos];
                        for (int z = 0; z < objetivos; z++)//copia de objetivos de individuos
                        {
                            temp[z] = datos_alg.get(x).get(j)[z];
                        }
                        frente_aproximado.add(temp);
                    }
                    datos_alg_copy.add(frente_aproximado);
                }
                datos_originales.add(datos_alg_copy);
            }

            double maximos[] = new double[objetivos];
            double minimos[] = new double[objetivos];
            //saca los extremos
            MaxMin.extremos(maximos, minimos);
            //Normaliza todos los datos
            MaxMin.normaliza(maximos, minimos);

            System.out.println("Frentes Filtrados y normalizados");
            //computa los indicadores de calidad para cada ejecución :S
            ArrayList<Double> IGD_mean = new ArrayList<>();
            ArrayList<Double> IGD_desvest = new ArrayList<>();
            ArrayList<Double> IGD_plus_mean = new ArrayList<>();
            ArrayList<Double> IGD_plus_desvest = new ArrayList<>();
            ArrayList<Double> GS_mean = new ArrayList<>();
            ArrayList<Double> GS_desvest = new ArrayList<>();
            ArrayList<Double> HV_mean = new ArrayList<>();
            ArrayList<Double> HV_desvest = new ArrayList<>();
            ArrayList<Double> Epsilon_mean = new ArrayList<>();
            ArrayList<Double> Epsilon_desvest = new ArrayList<>();
            ArrayList<Double> OS_mean = new ArrayList<>();
            ArrayList<Double> OS_desvest = new ArrayList<>();
            
            /* System.out.println("###########frentes eproximados#############");
            for (int i = 0; i < datos_originales.size(); i++) {
                System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Algortimo "+(i+1));
                for (int j = 0; j < datos_originales.get(i).size(); j++) {
                     System.out.println("   $$$$$$$$$$$$$$$$$$$$$ejecución "+(j+1));
                    for (int k = 0; k < datos_originales.get(i).get(j).size(); k++) {
                        System.out.println("["+k+"]   "+" "+Arrays.toString(datos_originales.get(i).get(j).get(k)));
                    }
                }
                
            }
            
             System.out.println("#######frente real######################");
             for (int i = 0; i < frente_real.size(); i++) {
                 System.out.println("["+i+"]   "+" "+Arrays.toString(frente_real.get(i)));
   
                
            }
            
            System.out.println("#####################################");*/

            for (int x = 0; x < algoritmos; x++) {
                ArrayList<Double> temp_igd = new ArrayList<>();
                ArrayList<Double> temp_igd_plus = new ArrayList<>();
                ArrayList<Double> temp_gs = new ArrayList<>();
                ArrayList<Double> temp_hv = new ArrayList<>();
                ArrayList<Double> temp_epsilon = new ArrayList<>();
                ArrayList<Double> temp_OS = new ArrayList<>();
                for (int j = 0; j < iteraciones; j++) {

                    double valor = 0;
                    valor = InvertedGenerationalDistance.Compute(frente_real, AnalizadorMO.datos.get(x).get(j));
                    System.out.println("IGD " + valor);
                    temp_igd.add(valor);

                    valor = GeneralizedSpread.Compute(frente_real, AnalizadorMO.datos.get(x).get(j));
                    System.out.println("GS " + valor);
                    temp_gs.add(valor);

                    //valor = HypervolumenWFG.Compute(AnalizadorMO.datos.get(x).get(j)); // Cambiar HVWFG por HV simple
                    valor = Hypervolumen.Compute(AnalizadorMO.datos.get(x).get(j)); // Cambiar HVWFG por HV simple
                    System.out.println("HV " + valor);
                    temp_hv.add(valor);

                    valor = Epsilon.Compute_additive(frente_real, AnalizadorMO.datos.get(x).get(j));
                    //valor=Epsilon.epsilon_original(frente_real, AnalizadorMO.datos.get(x).get(j));
                    //System.out.println("Epsilon " + valor);
                    temp_epsilon.add(valor);

                    valor = IGDplus.Compute(frente_real, AnalizadorMO.datos.get(x).get(j));
                    //System.out.println("IGD+ " + valor);
                    temp_igd_plus.add(valor);

                    valor = OverallSpread.Compute(AnalizadorMO.datos.get(x).get(j));
                    System.out.println("OS " + valor);
                    temp_OS.add(valor);

                    System.out.println("Procesado " + problema + " Algoritmo " + x + " Iteracion " + j + " ");
                }

                IGD_mean.add(MedianaVarianza.Mediana(temp_igd));
                IGD_desvest.add(MedianaVarianza.IQR(temp_igd));
                EscrituraArchivo.Escribe_Archivo(temp_igd, problema + "_IGD_Alg" + x);
                EscrituraArchivo.Escribe_Best_FUN_MIN(temp_igd, AnalizadorMO.datos_originales.get(x), "BEST_IGD_" + nombres_algoritmos.get(x));

                IGD_plus_mean.add(MedianaVarianza.Mediana(temp_igd_plus));
                IGD_plus_desvest.add(MedianaVarianza.IQR(temp_igd_plus));
                EscrituraArchivo.Escribe_Archivo(temp_igd_plus, problema + "_IGDPlus_Alg" + x);
                EscrituraArchivo.Escribe_Best_FUN_MIN(temp_igd_plus, AnalizadorMO.datos_originales.get(x), "BEST_IGDPlus_" + nombres_algoritmos.get(x));

                GS_mean.add(MedianaVarianza.Mediana(temp_gs));
                GS_desvest.add(MedianaVarianza.IQR(temp_gs));
                EscrituraArchivo.Escribe_Archivo(temp_gs, problema + "_GS_Alg" + x);
                EscrituraArchivo.Escribe_Best_FUN_MIN(temp_gs, AnalizadorMO.datos_originales.get(x), "BEST_GS_" + nombres_algoritmos.get(x));

                HV_mean.add(MedianaVarianza.Mediana(temp_hv));
                HV_desvest.add(MedianaVarianza.IQR(temp_hv));
                EscrituraArchivo.Escribe_Archivo(temp_hv, problema + "_HV_Alg" + x);
                EscrituraArchivo.Escribe_Best_FUN_MAX(temp_hv, AnalizadorMO.datos_originales.get(x), "BEST_HV_" + nombres_algoritmos.get(x));

                OS_mean.add(MedianaVarianza.Mediana(temp_OS));
                OS_desvest.add(MedianaVarianza.IQR(temp_OS));
                EscrituraArchivo.Escribe_Archivo(temp_OS, problema + "_OS_Alg" + x);
                EscrituraArchivo.Escribe_Best_FUN_MAX(temp_OS, AnalizadorMO.datos_originales.get(x), "BEST_OS_" + nombres_algoritmos.get(x));

                Epsilon_mean.add(MedianaVarianza.Mediana(temp_epsilon));
                Epsilon_desvest.add(MedianaVarianza.IQR(temp_epsilon));
                EscrituraArchivo.Escribe_Archivo(temp_epsilon, problema + "_Epsilon_Alg" + x);
                EscrituraArchivo.Escribe_Best_FUN_MIN(temp_epsilon, AnalizadorMO.datos_originales.get(x), "BEST_Epsilon_" + nombres_algoritmos.get(x));

            }
            Estadisticos.Imprime_scripts_R(problema); //ESTADISTICOS POR PROBLEMA

            System.out.println("Mediana IGD");
            for (int x = 0; x < IGD_mean.size(); x++) {
                System.out.print(IGD_mean.get(x) + " ");
            }
            System.out.println();
            /*System.out.println("Mediana IGD Plus");
            for (int x = 0; x < IGD_plus_mean.size(); x++) {
                System.out.print(IGD_plus_mean.get(x) + " ");
            }
            System.out.println();*/
            System.out.println("Mediana GS");
            for (int x = 0; x < GS_mean.size(); x++) {
                System.out.print(GS_mean.get(x) + " ");
            }
            System.out.println();
            /*System.out.println("Mediana HV");
            for (int x = 0; x < IGD_mean.size(); x++) {
                System.out.print(HV_mean.get(x) + " ");
            }
            System.out.println();
            System.out.println("Mediana Epsilon");
            for (int x = 0; x < Epsilon_mean.size(); x++) {
                System.out.print(Epsilon_mean.get(x) + " ");
            }
            System.out.println();*/
            System.out.println("Mediana OS");
            for (int x = 0; x < Epsilon_mean.size(); x++) {
                System.out.print(OS_mean.get(x) + " ");
            }
            System.out.println();
            Latex.printQualityIndicator_IGD(IGD_mean, IGD_desvest);
            Latex.printQualityIndicator_IGD_plus(IGD_plus_mean, IGD_plus_desvest);
            Latex.printQualityIndicator_GS(GS_mean, GS_desvest);
            Latex.printQualityIndicator_HV(HV_mean, HV_desvest);
            Latex.printQualityIndicator_Epsilon(Epsilon_mean, Epsilon_desvest);
            Latex.printQualityIndicator_OS(OS_mean, OS_desvest);
        }

        Latex.Termina_latex_IGD();
        Latex.Termina_latex_IGD_plus();
        Latex.Termina_latex_GS();
        Latex.Termina_latex_HV();
        Latex.Termina_latex_Epsilon();
        Latex.Termina_latex_OS();
        Estadisticos.Termina_scripts_R();
        Friedman.FriedmanTest_MIN("Epsilon");
        Friedman.FriedmanTest_MAX("HV");
        Friedman.FriedmanTest_MIN("IGD");
        Friedman.FriedmanTest_MIN("IGDPlus");
        Friedman.FriedmanTest_MAX("OS");
        Friedman.FriedmanTest_MIN("GS");
    }

}
