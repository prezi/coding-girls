# Házifeladat megoldások
1. Oszd fel a vásznat négy részre egy vízszintes és egy függüleges felező egyenessel. Attól függően, hogy a kurzor melyik tartományban van, változtassuk a háttér színét! 
### Megoldás
Ennek a megoldását az 'if_4reszre.pde' fájlban megtaláljátok. Egy másik megoldást is adtunk az 'if_4reszre2.pde' fájlban. Az első megoldásban 4 if ágazással csináltuk, míg a másikban 1 if-else ágazást használtuk, és mindegyik ágban még egy if-else ágazást csináltunk.  Akárhogyan nézzük, 4 külön esetet tekintettük. 

2. For ciklus segítségével készíts ilyen ábrát!
![koncentrikus_korok](http://oi59.tinypic.com/fz1w5.jpg)
### Megoldás
Ennek a megoldását a 'korok.pde' fájlban megtaláljátok. Fontos, hogy a nagyobb köröket rajzoljuk először, különben a nagyobb körök eltakarnák a kisebbeket.  Úgy írtuk, hogy a körök számát könnyen változtathassuk, ha akarnánk. Te is úgy írtad?

3. Bővítsük ki a sorházunkat lakóparkká! Legyen 3 sornyi ház, minden sorban 5 épülettel. De figyeljünk arra, hogy ne fedjék egymást a házak.
![lakopark](http://oi57.tinypic.com/112679g.jpg)
### Megoldás
Ennek a megoldását a 'lakopark.pde' fájlban megtaláljátok. A 'sorhaz.pde'-ból kiindulva, a for ciklust körbevettük még egy for ciklussal, mert ugyanazt akartuk rajzolni, csak más y coordináttal.  Szóval az y értékét megnöveltük mindegyik kör után, és az x értékét vissza kellett állítanunk az eredeti értékére. Mi történt volna ha az x coordinátot nem írtuk volna át?

# Szorgalmi házifeladat csütörtökre
1. Rajzolj ki egy ábrát, ami mozog a képernyõ két széle között! 
http://makeagif.com/CTo6pY (bénácska gif)
A feladathoz nem kell ciklus, csak elágazás és a draw blokk. Egyszerûbb, vagy más alakzatot is használhattok.

2. Rajzolj egy négyzten belül pontokat úgy, hogy egymástól azonos távolságban legyenek a sor- és oszlopszomszédok!
![szorgalmi_pontos](http://i62.tinypic.com/op9s77.jpg)
A feladatot szintén egymásba ágyazott ciklusokkal oldd meg!
	pont kirajzolása : point(x, y);
