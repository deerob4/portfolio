%{
name: "Memory Explorer",
image: "memory_explorer_light.png",
visit_uri: "https://marketplace.visualstudio.com/items?itemName=nordic-semiconductor.nrf-connect",
technologies: ["React", "Zustand", "DAP"]
}

---

Et grafisk verktøy integrert i VS Code som leser minneinnholdet fra
en tilkoblet enhet og viser den i en hex-editor. Ved å trykke på en
hex-cell kan man skrive direkte til minnet. Verktøyet er skrevet i
TypeScript med React, og bruker en custom implementasjon av
Microsoft sin [Debug Adapter Protocol](https://microsoft.github.io/debug-adapter-protocol)
for å lese selve minnet.
