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
public class Relation {

  public int i;
  public int j;

  public Relation() {

  }

  public Relation(int x, int y) {
    i = x;
    j = y;
  }
  
  public String toString() {
	  return "("+i+","+j+")";	  
  }

}