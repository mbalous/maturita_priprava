- overuji komunikaci mezdi jednotlivymi komponentami v ramci aplikace, aplikace a OS / HW / API

Nektera pravidla charakterizujici integracni testy
1. test pouziva databazi
2. test pouziva sit
3. test pouziva externi system (mailovy server)
4. test zapisuje / cte soubory nebo provadi jine I/O operace

## Unit testy vs. integracni testy

| Unit test | Integracni test |
|--------|--------|
| Vysledek zalezi pouze na kodu | Vysledek je zavisly i na externich systemech |
| Snadna tvorba | Uvodni nastaveni muze byt slozite |
| Testovana pouze jedna trida / jednotka | Testovano vice komponent|
| Prevazne pouzivan vyvojari | Uzitecny i pro QA, help desk |
| Failed unit tested znamena spatny kod | Failed integration test muze znamenat spatne prostredi |

## Prikaldy integracnich testu
Overeni spravneho zapisu / cteni objednavek z DB
overeni integrace CRM s mail serverem

