# CSS
<!--
ctrl+c block

```css

```
-->


## div & span
- `<div>` je element blokový
- `<span>` je element řádkový

Tag `<div>` před sebou a za sebou udělá konec řádku. Span se bez problému může vyskytovat v jednom řádku.

Span použijeme například pro úpravu kusu textu.


## Selektory


### `*` Hvězdičkový selektor

```css
* {color: red} /* Všechny elementy na stránce budou červeně.*/
```

```css
p * {color: red} /* Všechny elementy v odstavci budou modré. */
```


### `T` Typový selektor

Za `T` dosadíme typ elementu, například <**div**> nebo <**a**>

```css
div {color: red} /* všechny divy budou červené */
```

```css
/*
 * nadpisy s identifikátorem budou červené
 * identifikátor může být libovolný, ale musí být nastavený
 */

h1[id] {color: red}
```

```css
/* checkboxy budou červené */
input[type=checkbox] {background: red}
```

### `.` Třídní selektor

```html
<p class="centrovany">
        <img src="obrazky/avatar.png" alt="avatar" />
</p>
```

``` css
.centrovany {
        text-align: center;
}
```

Obsah ve všech elementech se třídou centrovany bude nyní zarovnaný na střed. Název je poněkud matoucí, jedná se o zarovnání obsahu, nikoli textu.

## Pseudotřídy
Třídy, které přidají speciální vlastnosti na některé prvky. Nejznámější pseudo-třídy jsou pro odkazy, např.: `a:hover`.

## Pseudoelementy
Pomocí pseudolelementu můžeme nastylovat například první písmeno nebo první řádek elementu. Oproti zápisu pseudotříd používáme dvě dvojtečky - `::`.


Následující kód zajistí, že na stránce bude vždy první řádek elementu `<p>` červeně.
```html
<p>You can use the ::first-line pseudo-element to add a special effect to the first line of a text. Some more text. And even more, and more, and more, and more, and more, and more, and more, and more, and more, and more, and more, and more.</p>
```

```css
p::first-line { color: #ff0000; }
```

### Pseudoelement `::before` a `::after`
Tento kód zapříčiní, že se před každý element `<h1>` (nadpis úrovně jedna) vloží obrázek.

```css
h1::before {
    content: url(smiley.gif);
}
```

Tento kód zapříčiní, že se za každý element `<h1>` (nadpis úrovně jedna) vloží obrázek.

```css
h1::after {
    content: url(smiley.gif);
}
```

### Seznam pseudoelementů
| Selektor | Příklad | Popis |
|--------|--------|--------|
|     `::after`   |    `p::after`    | 	Insert something after the content of each <p> element|
|     `::before`   |    `p::before`    | Insert something before the content of each <p> element|
|     `::first-letter`   |    `p::first-letter`    | 	Selects the first letter of each <p> element|
|     `::first-line`   |    `p::first-line`    | Selects the first line of each <p> element|
|     `::selection`   |    `p::selection`    |	Selects the portion of an element that is selected by a user |

