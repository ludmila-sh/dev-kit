# Project

<!-- One or two lines: what this site is and for whom. -->

## Stack

Static site on Astro: no server, free hosting (GitHub Pages or Cloudflare Pages), texts in Markdown. For a one-page site with no growth, plain HTML and CSS without dependencies is acceptable. I am a beginner in frontend and Node: explain anything new in one line.

Before creating the project, check the current Astro documentation (creation command, versions) and do not write them from memory. Create the project with the official starter, not by hand.

## Principles

- Minimum of dependencies. Name every new one and explain why it is needed.
- No server, database or CMS unless I explicitly ask. If a client needs to edit texts themselves, first propose a simple option and discuss it with me.
- Variables with a `PUBLIC_`, `VITE_` or `REACT_APP_` prefix end up in the browser. Secrets, keys and tokens never go into the frontend under any circumstances. If a feature needs a secret, it needs a backend.

## Site quality

- Responsive layout, checked at phone width.
- Every page has a `title` and a `meta description`; images have `alt`; one `h1` per page.
- Images are compressed, no unnecessary JavaScript.
- Contacts and links are checked by hand before delivery.

## Structure

- `src/` — pages, components, styles. `public/` — static files.
- `docs/` — notes and texts for humans, if needed.
- `ROADMAP.md` — goal and milestones. `STATUS.md` — current state, overwritten.

## README

I do not write READMEs by hand: you maintain it following the structure already laid out in `README.md`. Write in English, briefly. Sections: one-sentence description, Quick start, Configuration (public variables only), Project structure, Deployment. Delete an empty section. Update it when the way to run, the variables or the hosting change.
