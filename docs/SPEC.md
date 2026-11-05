# IMT & NLP Flow - POC spec

Source: operator spec "אפיון מערכת מלא (HLD & LLD) - אפליקציית וויסות רגשי IMT & NLP" (Google Drive, v1.0).

## Scope of this POC
- One static `index.html` (HTML + CSS + vanilla JS), `manifest.json`, `sw.js`, `icons/`.
- Hebrew, RTL, mobile-first. No backend. No analytics. Data stays in `localStorage`.

## Flow (state machine)
1. Emotion - chips (חרדה, כעס, תסכול, חוסר אונים, פחד, עומס/לחץ, אשמה) or free text + mic. Tap moves on.
2. Baseline - buttons 1-10, tap moves on (no confirm).
3. Anchor - when/where, with whom, core thought. Button "קבע עוגן והמשך".
4. Posture - seated figure SVG + alternating hands. Button "התחל סיבוב (60 שניות)".
5. Tapping - 60s countdown, alternating L/R light + panned click, soft bell at the end, "עצור סיבוב מוקדם".
6. Re-observation - what I noticed (text + mic), re-rate 0-10 against the core thought.
   - rating > 0: cognitive bridge screen (5s auto continue), round++, back to step 5.
   - rating == 0: step 7.
7. Integration - does the root event still trigger (yes/no, if yes rate 0-10 and allow one more round), new learning, save.
8. Summary - sparkline of baseline + every round, session card, local history list.

## Data
- `imt_sessions_v1`: array of `SessionRecord` (spec 2.3).
- `imt_prefs_v1`: `UserPreferences` (BPM default 60, volume, TTS on/off, click type snap|wood|metronome).

## Acceptance (POC)
- Full flow works on a phone browser, audio after first tap, TTS in he-IL when the device has a Hebrew voice.
- Session saved and shown in history after reload.
- Works offline after first load (service worker).
- Not a medical device: a short disclaimer on the start screen.
