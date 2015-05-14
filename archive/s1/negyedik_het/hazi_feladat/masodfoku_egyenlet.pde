/*

Irj egy függvényt, ami ki tudja számolni egy másodfokú egyenlet megoldásait.

A másodfokó egyenlet a*x^2 + b*x + c = 0 alakú. 
Készíts olyan függványt, ami a, b, c ismeretében 
- kiírja a képernyőre az egyenletet
- kiszámolja a megoldásokat.
Ez a függvény legyen:
float[] megold(float a, float b, float c)

Majd írjunk függvényt, ami kiírja a képernyőre az eredmény(eke)t.
(void kiir(float[] megoldasok))

Amit látni szeretnénk a képernyőn:

Az egyenlet: 1.0*x^2 + 2.0*x +3.0 = 0
A megoldasok:0 db
Az egyenlet: 1.0*x^2 + -2.0*x +1.0 = 0
A megoldasok:1 db
1.0
Az egyenlet: 1.0*x^2 + -2.0*x +-1.0 = 0
A megoldasok:2 db
2.4142137
-0.41421354

*/

void setup () {
  float a, b, c;
  a = 1;
  b = 2;
  c = 3;
 
  float[] megoldasok = megold(a, b, c);
  kiir(megoldasok);
  
  a = 1;
  b = -2;
  c = 1;
  kiir(megold(a,b,c));
 
  a = 1;
  b = -2;
  c = -1;
  kiir(megold(a,b,c));
}

float[] megold(float a, float b, float c) {

}

void kiir(float[] megoldasok) {

}



