# Launch checklist (internal, not for the client)

Go through it before sending HANDOFF.md. Add project-specific items under each section.

## Code and repository
- [ ] A fresh clone plus `.env.example` filled in starts and works.
- [ ] README is accurate; `.env.example` lists every variable.
- [ ] No secrets in the repository or its history (run gitleaks).
- [ ] Dependencies are pinned; `STATUS.md` is up to date.

## Accounts and secrets
- [ ] Every third-party account and key is created in the client's name.
- [ ] My development keys are revoked; the client's keys are in place.
- [ ] Secrets are delivered through a secure channel, not plain email or chat.

## Behavior
- [ ] Each main user scenario passes end-to-end (list them here per project).
- [ ] Garbage input does not crash it.
- [ ] If an external service is down, it fails loudly and logs the reason.

## Data and privacy
- [ ] I know what personal data is collected, where it is stored and for how long.
- [ ] Personal or medical data is not sent to third-party APIs without anonymization.
- [ ] A privacy policy exists if the platform or the law requires one.

## Hosting
- [ ] It is running, restarts on failure, logs rotate.
- [ ] Data worth keeping is backed up.

## Handover
- [ ] HANDOFF.md is filled in and in the client's language.
- [ ] I walked the client through it and they can do each task under "How to use it".
- [ ] What is not included is confirmed with the client.
