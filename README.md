# Egyszerű megoldási segédlet

<details>
  <summary>2.	Készítsen LINQ-lekérdezést, amely a gyerekek nevét, városát és országát listázza, és a gyerek neve szerint ábécé sorrendbe rendezi az eredményt.</summary>
  
  ```C#
 var gyerekekNevSzerint = megallok
    .OrderBy(x => x.GyerekNev)
    .Select(x => new { x.GyerekNev, x.Varos, x.Orszag })
    .ToList();
gyerekekNevSzerint
    .ForEach(x => Console.WriteLine($"{x.GyerekNev} – {x.Varos}, {x.Orszag}"));
  ```
</details>

<details>
  <summary>3.	Számolja meg LINQ-kal, hogy összesen hány gyerek van, akinek a Viselkedés értéke "Rossz".</summary>
  
  ```C#
  int rosszDb = megallok
     .Count(x => x.Viselkedes == "Rossz");
 Console.WriteLine(rosszDb);
  ```
</details>


<details>
  <summary>4.	Számolja meg, hogy hány különböző ország szerepel a listában!</summary>
  
  ```C#
 int orszagDb = megallok
    .Select(x => x.Orszag)
    .Distinct()
    .Count();
Console.WriteLine(orszagDb);
  ```
</details>


<details>
  <summary>5.	Listázza ki az összes különböző ország nevét ismétlődés nélkül, ábécé sorrendben!</summary>
  
  ```C#
  var orszagok = megallok
     .Select(x => x.Orszag)
     .Distinct()
     .OrderBy(x => x)
     .ToList();
 orszagok
     .ForEach(x => Console.WriteLine(x));
  ```
</details>


<details>
  <summary>6.	Listázza ki az összes Magyarországi és Olaszországi gyermeket, aki szenet kapott karácsonyra!</summary>
  
  ```C#
 var viselkedesTipusok = megallok
    .Where(x=>x.KapottAjandek=="szén" && x.Orszag=="Magyarország" || x.Orszag=="Olaszország")
    .ToList();
viselkedesTipusok
    .ForEach(x => Console.WriteLine(x));
  ```
</details>


<details>
  <summary>7.	Számolja meg, hogy hány gyerek kapott szenet ajándékba.</summary>
  
  ```C#
  int szenDb = megallok
     .Count(x => x.KapottAjandek == "szén");
 Console.WriteLine(szenDb);
  ```
</details>


<details>
  <summary>8.	Vizsgálja meg, hogy van-e legalább egy olyan gyerek, akinél a Kívánt Ajándék és a Kapott Ajándék nem egyezik meg.</summary>
  
  ```C#
  bool vanEltérés = megallok
     .Exists(x => x.KivantAjandek != x.KapottAjandek);
 Console.WriteLine(vanEltérés ? "Igen" : "Nem");
  ```
</details>


<details>
  <summary>9.	Keresse meg azt a gyereket, akinek a Kapott Ajándék szövege a leghosszabb (legtöbb karakter). Az eredményben jelenítse meg legalább a gyerek nevét, országát és a kapott ajándék nevét!</summary>
  
  ```C#
  var leghosszabb = megallok
     .OrderByDescending(x => x.KapottAjandek.Length)
     .First();
 Console.WriteLine($"{leghosszabb.GyerekNev} – {leghosszabb.Orszag}, kapott ajándék: {leghosszabb.KapottAjandek}");
  ```
</details>


<details>
  <summary>10.	Csoportosítsa a gyerekeket a Viselkedés mező alapján, és írja ki, hogy az egyes viselkedés típusokhoz (Jó / Rossz / Változó) hány gyerek tartozik. Az eredményt a gyerekek száma szerint csökkenő sorrendben rendezze!</summary>
  
  ```C#
 var viselkedesStatisztika = megallok
    .GroupBy(x => x.Viselkedes)
    .Select(x => new
    {
        Viselkedes = x.Key,
        Db = x.Count()
    })
    .OrderByDescending(x => x.Db)
    .ToList();
viselkedesStatisztika
    .ForEach(x=> Console.WriteLine($"{x.Viselkedes}: {x.Db} gyerek"));
  ```
</details>


<details>
  <summary>11.	Országonként írja ki:
a.	mennyi gyereket látogatott ott meg a télapó,
b.	mennyi "Jó" viselkedésű gyerek volt ott,
c.	valamint mennyi olyan gyerek volt, aki nem azt kapta, amit kért az adott országban 
Az eredményt ország név szerint ábécé sorrendben rendezze!
</summary>
  
  ```C#
 var orszagStatisztika = megallok
    .GroupBy(x => x.Orszag)
    .Select(x => new
    {
        Orszag = x.Key,
        OsszGyerek =x.Count(),
        JoDb = x.Count(y => y.Viselkedes == "Jó"),
        ElteroAjandekDb = x.Count(y => y.KivantAjandek != y.KapottAjandek)
    })
    .OrderBy(x => x.Orszag)
    .ToList();
orszagStatisztika
    .ForEach(x => Console.WriteLine($"{x.Orszag}: összesen {x.OsszGyerek} gyerek, Jó = {x.JoDb}, eltérő ajándék = {x.ElteroAjandekDb}"));
  ```
</details>

<details>
  <summary>12.	Csoportosítson Kívánt Ajándék szerint, és határozza meg:
a.	melyik kívánt ajándék fordul elő a legtöbbször,
b.	és azt hány gyerek kérte.
Az eredményben jelenjen meg az ajándék neve és az előfordulások száma!
</summary>
  
  ```C#
  var leggyakrabbanKert = megallok
     .GroupBy(x => x.KivantAjandek)
     .Select(x => new
     {
         Ajandek = x.Key,
         Db = x.Count()
     })
     .OrderByDescending(x => x.Db)
     .First();
 Console.WriteLine($"{leggyakrabbanKert.Ajandek}: {leggyakrabbanKert.Db} gyerek kérte");
  ```
</details>


<details>
  <summary>13.	Országonként számolja meg, hány "Jó" viselkedésű gyerek van, és írja ki, hogy:
a.	melyik országban van belőlük a legtöbb,
b.	és ez hány gyereket jelent.
</summary>
  
  ```C#
  var legtobbJoOrszag = megallok
     .GroupBy(x => x.Orszag)
     .Select(x => new
     {
         Orszag = x.Key,
         JoDb = x.Count(y => y.Viselkedes == "Jó")
     })
     .OrderByDescending(x => x.JoDb)
     .First();
 Console.WriteLine($"{legtobbJoOrszag.Orszag}: {legtobbJoOrszag.JoDb} jó gyerek");
  ```
</details>




