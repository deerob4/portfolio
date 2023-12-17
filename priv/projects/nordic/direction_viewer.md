%{
name: "Direction Viewer",
image: "direction_viewer.png",
technologies: ["React", "D3", "Redux", "Electron", "charts.js"]
}

---

En interaktiv 3D-visualisering som demonstrerer de
rettningsfinnendevnene til Nordics antennaoppstilling. Applikasjonen
bruker three.js for å vise posisjonen til en tilkoblet beacon
relativ til antennaoppstillinga. Grafer av øvrige lesninger er
rendret med charts.js. Den kjører i et Electron-vindu og utfører
avlesninger gjennom node-serial biblioteket. Redux brukes som state
management-løsning.
