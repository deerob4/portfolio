%{
name: "Devicetree Visual Editor",
image: "dts_light.png",
visit_uri: "https://marketplace.visualstudio.com/items?itemName=nordic-semiconductor.nrf-devicetree",
technologies: ["React", "D3", "Zustand", "VS Code"]
}

---

Et grafisk editor for et kompleks hardwaredesignspråk. Istedenfor å
måtte skrive språket for hånd, lar editoren brukere designe
hardwaren sin gjennom et intuitivt brukergrensesnitt. Idet man gjør
en endring i GUIen, skrives den tilsvarende koden automatisk. Den
inkluderer en custom SVG layoutmotor som dynamisk rendrer
kretsdiagrammer, og bruker D3 for å lage en pannable canvas. Zustand
brukes til state management.
