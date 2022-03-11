/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadormoo;

/**
 *
 * @author Alx
 */
public class ParejaMAX implements Comparable {

  public double indice;
  public double valor;

  public ParejaMAX() {

  }

  public ParejaMAX(double i, double v) {
    indice = i;
    valor = v;
  }

  public int compareTo (Object o1) { //ordena por valor absoluto

    if (Math.abs(this.valor) > Math.abs(((ParejaMAX)o1).valor))
      return -1;
    else if (Math.abs(this.valor) < Math.abs(((ParejaMAX)o1).valor))
      return 1;
    else return 0;
  }


}
