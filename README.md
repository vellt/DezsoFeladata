# Komplex megoldási segédlet

<details>
  <summary>2.	Készítsen LINQ-lekérdezést, amely megjeleníti az összes különböző ország nevét, ahova a télapó ellátogatott! Minden ország csak egyszer szerepeljen az eredményben! Az eredményt ábécé sorrendben listázza!</summary>
  
  ```C#
 var orszagok = megallok.Select(x => x.Orszag)
     .Distinct()
     .OrderBy(x=>x)
     .ToList();
 orszagok.ForEach(x => Console.WriteLine(x));
  ```
</details>

<details>
  <summary>3.	Készítsen LINQ-lekérdezést, amely kilistázza azon gyerekek nevét, városát és országát, akik szenet kaptak ajándékba! Az eredményt ország, azon belül város szerint rendezze!</summary>
  
  ```C#
var szenesGyerekek = megallok.Where(x => x.KapottAjandek == "szén")
    .OrderBy(x => x.Orszag)
    .ThenBy(x => x.Varos)
    .ToList();
szenesGyerekek.ForEach(x => Console.WriteLine($"{x.GyerekNev} {x.Varos} {x.Orszag}"));
  ```
</details>

<details>
  <summary>4.	Készítsen LINQ-lekérdezést, amely meghatározza, hogy melyik országban van a legtöbb „Jó” viselkedésű gyerek, és ez hány gyereket jelent! Az eredményben az ország nevét és a darabszámot jelenítse meg! </summary>
  
  ```C#
 var legtobbJo = megallok.Where(x=>x.Viselkedes=="Jó")
     .GroupBy(x => x.Orszag)
     .Select(x => new { Orszag = x.Key, Darab = x.Count() })
     .OrderByDescending(x => x.Darab)
     .First();
 Console.WriteLine($"{legtobbJo.Orszag}: {legtobbJo.Darab} db");
  ```
</details>

<details>
  <summary>5.	Készítsen LINQ-lekérdezést, amely listázza azon gyerekek nevét, városát és országát, akik nem azt az ajándékot kapták, amit kértek! Az eredményt a gyerek neve szerinti ábécé sorrendbe rendezze! </summary>
  
  ```C#
 var nemAztKaptak = megallok.Where(x => x.KapottAjandek != x.KivantAjandek)
     .OrderBy(x => x.GyerekNev)
     .ToList();
 nemAztKaptak.ForEach(x => Console.WriteLine($"{x.GyerekNev} {x.Varos} {x.Orszag}"));
  ```
</details>

<details>
  <summary>6.	Készítsen LINQ-lekérdezést, amely megadja, hogy az egyes ajándéktípusokból hány darabot osztott ki a télapó! Az eredményben jelenjen meg:
a.	az ajándék neve,
b.	az előfordulások száma.
 </summary>
  
  ```C#
 var ajandekStat = megallok.GroupBy(x => x.KapottAjandek)
      .Select(x => new
      {
          Ajandek = x.Key,
          Db = x.Count()
      })
      .ToList();
 ajandekStat.ForEach(x => Console.WriteLine($"{x.Ajandek}: {x.Db} db"));
  ```
</details>

<details>
  <summary>7.	Készítsen LINQ-lekérdezést, amely országonként megadja:
a.	az adott országban hány Jó viselkedésű gyerek volt,
b.	hány Rossz viselkedésű gyerek volt.
Az ország nevét, a jók számát és a rosszak számát jelenítse meg! Az eredményt a Jó gyerekek száma szerint csökkenő sorrendben rendezze!
 </summary>
  
  ```C#
 var orszagJoRossz = megallok.GroupBy(x=>x.Orszag)
     .Select(x => new 
     {
         Orszag= x.Key,
         JoDB= x.Count(y=>y.Viselkedes=="Jó"),
         RosszDB= x.Count(y => y.Viselkedes == "Rossz"),
     })
     .OrderByDescending(x=>x.JoDB)
     .ToList();
 orszagJoRossz.ForEach(x => Console.WriteLine($"{x.Orszag} jó: {x.JoDB}db, rossz: {x.RosszDB}db"));
  ```
</details>

<details>
  <summary>8.	Készítsen LINQ-lekérdezést, amely kilistázza azon országok neveit, ahol egyáltalán nem fordul elő Rossz viselkedésű gyerek! Az eredményt az országok nevei szerinti ábécé sorrendben jelenítse meg! </summary>
  
  ```C#
 var varosokNincsRossz = megallok
     .GroupBy(x => x.Orszag)
     .Select(x => new
     {
         Orszag = x.Key,
         RosszDb = x.Count(y=>y.Viselkedes=="Rossz")
     })
     .Where(x=>x.RosszDb==0)
     .OrderBy(x=>x.Orszag)
     .ToList();
 varosokNincsRossz.ForEach(x => Console.WriteLine(x.Orszag));
  ```
</details>

<details>
  <summary>9.	Készítsen LINQ-lekérdezést, amely megállapítja, melyik országban kapták a gyerekek a legtöbb különbözőféle ajándékot! Az eredményben jelenjen meg az ország neve és a különböző ajándéktípusok száma! </summary>
  
  ```C#
 var legtobbKulonbfeleJatek = megallok.GroupBy(x=>x.Orszag)
     .Select(x=> new
     {
         Orszag=x.Key,
         KulonbfeleJatekokDb=x.Select(y=>y.KapottAjandek).Distinct().Count()
     })
     .OrderByDescending(x=>x.KulonbfeleJatekokDb)
     .First();
 Console.WriteLine(legtobbKulonbfeleJatek.Orszag);
  ```
</details>

<details>
  <summary>10.	Készítsen LINQ-lekérdezést, amely kilistázza a Változó viselkedésű gyerekek adatait: név, város, ország és a kívánt ajándék. Az eredményt rendezze először ország, majd város szerint! </summary>
  
  ```C#
 var valtozoGyerekek = megallok.Where(x=>x.Viselkedes=="Változó")
     .OrderBy(x=>x.Orszag)
     .ThenBy(x=>x.Varos)
     .ToList();
 valtozoGyerekek.ForEach(x => Console.WriteLine($"{x.GyerekNev} {x.Varos} {x.Orszag}  {x.KivantAjandek}"));
  ```
</details>

<details>
  <summary>11.	Készítsen LINQ-lekérdezést, amely meghatározza, melyik kívánt ajándék szerepel a legtöbb gyereknél!
a.	a kívánt ajándék nevét,
b.	és hányszor kérték.
 </summary>
  
  ```C#
var legtobbKivantAjadekDb = megallok.GroupBy(x=>x.KivantAjandek)
    .Select(x=> new
    {
        KivantAjadek=x.Key,
        Db = x.Count()
    })
    .OrderByDescending(x=> x.Db)
    .First();
Console.WriteLine($"{legtobbKivantAjadekDb.KivantAjadek}: {legtobbKivantAjadekDb.Db}db");
  ```
</details>

<details>
  <summary>12.	Készítsen LINQ-lekérdezést, amely megállapítja, melyik városban van a legtöbb Rossz viselkedésű gyerek. </summary>
  
  ```C#
 var legtobbRossz= megallok.GroupBy(x=>x.Varos)
     .Select(x=> new
     {
         Varos= x.Key,
         Db = x.Where(y=>y.Viselkedes=="Rossz").Count()
     })
     .OrderByDescending(x=> x.Db)
     .First();
 Console.WriteLine(legtobbRossz.Varos);
  ```
</details>

<details>
  <summary>13.	Készítsen LINQ-lekérdezést, amely megadja, hogy a télapó hány országban fordult meg legalább három gyereknél. Az ország nevét és a gyerekszámot jelenítse meg! </summary>
  
  ```C#
 var legalabb3GyerekOrszagok = megallok.GroupBy(x => x.Orszag)
     .Select(x => new
     {
         Orszag = x.Key,
         GyerekDb = x.Count()
     })
     .Where(x => x.GyerekDb >= 3)
     .ToList();
 legalabb3GyerekOrszagok.ForEach(x => Console.WriteLine($"{x.Orszag}: {x.GyerekDb} gyerek"));
  ```
</details>

<details>
  <summary>14.	Készítsen LINQ-lekérdezést, amely előállítja a (kívánt ajándék – kapott ajándék) párok listáját, és megadja, hogy ezek a kombinációk hányszor fordultak elő. Csak azokat a párokat jelenítse meg, amelyek legalább kétszer szerepelnek! </summary>
  
  ```C#
 var kivantKapott = megallok.Select(x=> new
 {
     KivantAjandek=x.KivantAjandek,
     KapottAjandek=x.KapottAjandek,
     elofordulasDb = megallok.Where(y=>y.KapottAjandek==x.KapottAjandek && y.KivantAjandek==x.KivantAjandek).Count()
 })
 .Where(x=>x.elofordulasDb>=2)
 .ToList();
 kivantKapott.ForEach(x => Console.WriteLine($"{x.KivantAjandek} - {x.KapottAjandek}"));
  ```
</details>



