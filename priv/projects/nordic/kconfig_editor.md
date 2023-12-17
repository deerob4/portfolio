%{
name: "Kconfig Editor",
image: "kconfig_light.png",
visit_uri: "https://marketplace.visualstudio.com/items?itemName=nordic-semiconductor.nrf-kconfig",
technologies: ["React", "Zustand", "Python", "VS Code", "LSP"]
}

---

En React-frontend til [Kconfig](https://www.kernel.org/doc/html/v5.18/kbuild/kconfig-language.html),
et konfigurasjonsverktøy som konfigurerer konfigurasjonsverdier
for Linux-kernelen. Applikasjonen kjører inne i og har integrasjoner
med brukerens VS Code-vindu. Den kommuniserer med selve Kconfig
gjennom en Python API som implementerer Microsoft sin
[Language Server Protocol](https://microsoft.github.io/language-server-protocol/).
