# זרימה - IMT & NLP Flow (POC)

Static, client-only PWA for fast self-regulation: emotion, baseline, anchor memory, 60s bilateral tapping rounds, cognitive bridge, integration, summary.

- Live: https://danielmazh.github.io/imt-flow/
- Spec: [docs/SPEC.md](docs/SPEC.md)
- Run locally: `python3 -m http.server 8080` and open http://localhost:8080
- Data stays in the browser (`localStorage`: `imt_sessions_v1`, `imt_prefs_v1`). No backend, no analytics.
- Release: bump `VERSION` in `sw.js`.

Not a medical device and not a replacement for a professional.
