# Opplastningsscript til MUX

## Oppsett

Må ha installert `jq`.

Må ha alle filmene i en mappe i flat struktur.

Må ha `MUX_TOKEN_ID` og `MUX_TOKEN_SECRET` i en fil `.mux.env` i samme mappe som scriptet:

```
MUX_TOKEN_ID='TOKEN_ID_HER'
MUX_TOKEN_SECRET='TOKEN_SECRET_HER'
``` 

De hentes ut i Mux-interfacet

## Kjøring

Fra terminalen:

```
$ sh upload.sh PATH_TO_MOVIES
```

Hvor `PATH_TO_MOVIES` er relativ path til mappa filmene ligger


## Troubleshooting

Hvis scriptet ikke er kjørtbart, prøv å gjøre det kjørbart ved:

```
chmod u+x mux.sh
```
