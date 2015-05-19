##Mi az a processing JS és mire jó? 

A processing JS egy JavaScript fordító a Processing nyelvhez. A segítségével böngészőben lehet futtatni Processing programokat, anélkül, hogy le kéne tölteni a Processing keretprogramot. 


## hogyan működik? 
A munka PocessingJSsel a követlező módom működik: készítünk egy nagyon egyszerű HTML oldalt, ami behívja a processing.js fájt és szabványos html elemként megjeleníti a futó prpgramot. A fordítást, amit rendes körülmények között a Processing keretprogram végez, most majd a böngésző fogja elvégezni a JavaScript segítségével. A böngészőn kívül összesen erre a kis html fájlra és a processing.js scriptre van szükségünk. 

##Mi kell ahhoz, hogy használhassam? 
Szükség lesz 2 programra. Töltsétek le és telepítsétek a FireFox böngészőt (https://www.mozilla.org/en-US/firefox/new/) és a Sublime Text 2 http://www.sublimetext.com/2) szerkesztőt. A firefox meg fogja kérdezni, hogy az legyen-e az alapértelmezett böngésző, de ez nem szükséges. Mindenképpen olyan böngészőre van szükség, ami támogatja a HTML5 szabványt. Más okokból, de Chrome böngészővel a megoldás nem működik. 


## Előkészítő lépések
1. Készíts egy mappát amiben a pogramjaidat fogod tartani, pl egy Anna nevű mappát az asztalon. 

2. Töltsd le a processing.min.js nevű fájlt erről az oldalról: http://processingjs.org/download/. Ezt úgy teheted meg, hogy jobb egérgombbal rákattintasz, és a Mentés másként (Save link as) opciót választod. A mentésnél figyelj arra, hogy a fájltípusnál a "Minden fájl (*.*)" legyen kiválasztva. A fájlt az előbb létrehozott Anna nevű mappába mentsd, figyelj rá, hogy a neve processing.min.js legyen. Ez azért fontos, mert ha be van állítva valami fájltípus, akkor a Wondows hozzáadja a fájlnévhez a megfelelő kiterjesztést, és emiatt mmás lesz a fájl neve végül, mint amit mi megadtunk. 

3. Nyisd ki a Sublime text pogramot. Kezdj egy új dokuentumot, és készíts benne egy pici Processing példaprogramot, például ezt:
```
size(300, 300);
fill(#ff0000);
ellipse(150, 150, 100, 100);
```
Mentsd el az Anna mappába pelda.pde néven. Itt is figyelj arra, hogy mentsnél a fájl típusának Minden fájl (*.*) éegyen beállítva, és a fájl neve mezőbe te írd bele a .pde kiterjesztést. Megintcsak, ez azért fontos, hogy a létrehozott fájl neve pelda.pde legye és ne pelda.pde.txt például. 

4. A Sublime text 2-ben nyiss egy új fájlt, és másold bele a következőket:
```
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <title>Hello Web - Processing.js Test</title>
    <script src="processing.min.js"></script>
</head>
<body>
    <h1>Processing.js Test</h1>
    <p>This is my first Processing.js web-based sketch:</p>
    <canvas data-processing-sources="pelda.pde"></canvas>
</body>
</html>
```
Ezt is mentsd el az Anna nevű mappába, pl anna.html néven. Megintcsak nagyon figyelj arra, hogy a fájl kiterkesztése .html legyen, ne engedd, hogy a windows mást hozzáragasszon.

5. Nyisd ki a Firefox böngészőt, és nyisd meg vele az anna.html fájlt. Ezt megtehteted a Firefox menüjéből (File/megnyitás), vagy egyszerűen ráhúzhatod a fájlt a windows explorerből a böngészőablakra. Ha minden rendben ment, akkor meg kéne jelennie egy olyan oldalnak, amin rajta van a piros körünk.  


## Hogyan tovább? 
A programjaidat ezentúl a .pde kiterkesztésű fájlokba írhatod, és úgy tudod megjeleníteni, hogy a html fájlba a pelda.pd helyére beírod a nevét. Sőt, azt is megteheted, hogy a ```<canvas data-processing-sources="pelda.pde"></canvas>``` sort többször s beleteszed az anna.html fájlba, és mindegyikben más Processing programot jelenítesz meg. 
Két dologra kell nagyon figyelned: minden fájlod legyen egyetlen mappában, ugyanabban mint amiben a processing.min.js és az ana.html fájl van. Ez érvényes a felhasznált képekre is. A másik, hogy mindig figyelj, hogy jó néven mentsd el a fájlokat. 


## Miben lesz ez más, mint a processing keretporgram? 
3 dologban:
Előny:

1. A rogramjaidat bármikor magaddal viheted akár egy pendriveonés megmutathatod akárhol, ahol van firefox vagy egy újabb Internet explorer böngésző, nem kell hozzá telepíteni a processing programot. 

Hátrányok:
2. A Sublime textben alapból nincs syntax highlight processinghez.  
3. Nem fogod látni a Processing hibaüzeneteit. Ha hibás a progrmaod, akkor egyserűen nem fog megjelenni a kép a böngészőben, de nehéz lesz rájönni, hogy mi a probléma. 

Mindkét hátrányt meg lehet oldalni. 
2. A sublime texthez létezik kiegésztés amivel kiszínezi a Processing programokat: TBD. 
3. A hibák megtalálásához hasnzálhatjuk A firefox developer toolbaarját. Ott Javascript fülben megjelennek a processing hibaüzenetei. TBD. 

<a href=""></a>