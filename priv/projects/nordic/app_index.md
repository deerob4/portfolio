%{
name: "nRF Connect SDK App Index",
image: "app_index.png",
repo_uri: "https://github.com/nrfconnect/ncs-app-index",
visit_uri: "https://nrfconnect.github.io/ncs-app-index",
technologies: ["React", "Next.js", "Tailwind", "GitHub Actions"]
}

---

Et nettsted som inneholder informasjon om sampleapplikasjoner som
fungerer med nRF Connect SDKen. Brukerne kan søke etter og filtrere
samplene basert på hva slags prosjekt de starter. Nettstedet er en
Next.js-applikasjon som på byggetidspunktet bruker GitHub-SDKen for
å hente informasjon om samplene, for så å generere en statisk
nettside som enkelt kan hostes. Når indeksen blir oppdatert kjører
en GitHub Actions-pipeline for å gjenoppbygge og distribuere
nettstedet på nytt.
