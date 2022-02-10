/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadormo;

import static analizadormo.HypervolumenWFG.BEATS;
import java.util.Comparator;

/**
 *
 * @author Alx
 */
    public class ComparadorGreaterAbbrev implements Comparator{

            @Override
            public int compare(Object o1, Object o2) {
              HypervolumenWFG.POINT p = (HypervolumenWFG.POINT) o1;
              HypervolumenWFG.POINT q = (HypervolumenWFG.POINT) o2;
  for (int i = HypervolumenWFG.n-2; i >= 0; i--)
    if (BEATS(p.objectives[i],q.objectives[i])) return -1;
    else
    if (BEATS(q.objectives[i],p.objectives[i])) return  1;
  return 0;
            }
    
    }
