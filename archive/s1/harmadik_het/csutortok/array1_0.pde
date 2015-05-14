void setup() {
  // bevezető: szeretnék sok változót könnyen együtt kezelni
  // első tömbünk, csak írjuk ki belőle az értékeket
  Array tombom = {"répa","retek","mogyoró"};
  for(int i = 0; i<tombom.length; i++) {
    println(tombom[i]);
  }
  
  Array szamok = {1,42,5,16,20,8,55,10};
  // összeg - lefoglaló feladatnak
  int osszeg = 0;
  for(int i = 0; i<szamok.length; i++) {
    osszeg += szamok[i];
  }
  println(osszeg);
  
  // max kereső
  int max = 0;
  for(int i = 0; i<szamok.length; i++) {
    if(szamok[i]> max) {
      max=szamok[i]; 
    }
  }
  println(max);
}
