# Design brief - "זרימה" (IMT & NLP Flow), mobile PWA

Product: a calm Hebrew (RTL) phone app for fast self-regulation. The user picks an emotion, rates it, anchors an early memory and a core thought, then does 60-second rounds of bilateral tapping (left/right on the thighs, eyes closed) with clicks that move between the ears. After each round they write what they noticed and re-rate 0-10. Above 0: a short "cognitive bridge" screen and the next round. At 0: integration questions and a summary with a trend chart.

Audience: an adult under stress, one hand, maybe in tears. Every screen must be readable in one glance. Big thumb targets (min 56px), one main action per screen at the bottom, no clutter.

Quality bar: looks like a premium wellness app (Calm, Headspace, Oura level), not a hobby page. Professional typography, real spacing scale, consistent radius, subtle depth. Dark, warm-calm palette (deep blue-green night, soft mint accent, warm sand second accent). Must also hold contrast for reading.

Typography: Hebrew-first. Use "Rubik" or "Assistant" (Google Fonts). Clear scale: display 30, title 22, body 17, caption 14.

Frame size: iPhone 390x844, safe areas respected. All copy in Hebrew, right-aligned, RTL layout (back/home on the right, settings on the left).

Screens (one top-level frame each, real copy):
1. Home - greeting, one-line explanation, "להתחיל תהליך" CTA, recent sessions (2 cards with small trend), privacy/disclaimer footnote.
2. Emotion - prompt "מה הרגש שעולה בך עכשיו?", 7 chips (חרדה, כעס, תסכול, חוסר אונים, פחד, עומס/לחץ, אשמה), free text with mic button.
3. Baseline - "באיזו עוצמה זה מורגש כרגע?" 1-10 as a beautiful scale (2 rows of 5, or a tappable arc), helper labels.
4. Anchor - three fields: איפה ומתי, עם מי, המחשבה המרכזית; each with mic; CTA "קבע עוגן והמשך".
5. Posture - a large animated area showing a seated STICK MAN (round head, line body) on a simple chair, hands resting on thighs, tapping left/right. Instruction text, round number, CTA "התחל סיבוב · 60 שניות".
6. Tapping - big calm countdown 00:42, circular progress ring around it, two soft orbs (left/right) that glow alternately, the stick man small and tapping, "עצור סיבוב" secondary button. Must feel like a meditation timer.
7. Re-observe - "מה שמת לב?" text area with mic, the original core thought shown as a quote card, 0-10 rating (0 highlighted as the goal).
8. Bridge - full-screen breathing moment: the bridge sentence, the user's last observation as a quote, a 6-second circular countdown, "לסיבוב הבא".
9. Integration - celebration of reaching 0 (subtle), "האם האירוע המקורי עדיין נוגע בך?" yes/no segmented control, learning text area, CTA "סיום ושמירה".
10. Summary - trend chart (8 → 5 → 2 → 0) as a smooth area chart, session card, journal list.
11. Settings sheet - bottom sheet: tapping speed slider, volume, click sound segmented (אצבע / עץ / מטרונום), voice prompts toggle, clear journal (destructive).

Components to define as reusable: primary button, ghost button, chip, number key, text field with mic, quote card, session card, progress bar (top), orb, icon buttons. Define colors, radius, spacing and type as variables.
