Pomocí reflexe je totiž možné za běhu programu dynamicky zjišťovat informace o existujících typech.

## Ukazka reflexe

```csharp
/// <summary>
/// Trida predstavujici osobu, ktera bude pouzita v
/// uvodnim prikladu na pouziti reflexe
/// </summary>
public class Osoba
{
  private string jmeno;
  private string prijmeni;
  private DateTime datumNarozeni;

  public string Jmeno
  {
    get{return jmeno;}
    set{jmeno = value;}
  }

  public string Prijmeni
  {
    get{return prijmeni;}
    set{prijmeni = value;}
  }

  public DateTime DatumNarozeni
  {
    get{return datumNarozeni;}
    set{datumNarozeni = value;}
  }

  public int VypocistVek()
  {
    TimeSpan lSpan = DateTime.Now - datumNarozeni;
    return lSpan.Days / 365;
  }

  public Osoba(){}
}

/// <summary>
/// Uvodni priklad pouziti reflexe
/// </summary>
public class PrikladReflexe
{
  public static void VypisCleny(Type Typ)
  {
    Console.WriteLine("Vypisuji vlastnosti typu {0}",Typ.Name);
    //ziskani vsech clenu
    MemberInfo[] lSeznamClenu = Typ.GetMembers();
    foreach(MemberInfo lInfo in lSeznamClenu)
    {
      Console.WriteLine("Nazev clenu = {0} - druh clenu = {1}", lInfo.Name,lInfo.MemberType);
    }
  }

  public static void Priklad()
  {
    Osoba lOsoba = new Osoba();
    //ziskani instance tridy Type pomoci metody GetType
    Type lTypOsoba = lOsoba.GetType();
    //ziskani instance tridy Type pomoci staticke Metody
    //GetType tridy type
    Type lTypInt32 = Type.GetType("System.Int32");
    //ziskani instance tridy Type pouzitim operatoru typeof
    Type lTypString = typeof(string);

    VypisCleny(lTypOsoba);
    VypisCleny(lTypInt32);
    VypisCleny(lTypString);
  }
}
```