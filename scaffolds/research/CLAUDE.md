# Research

<!-- The research question and the decision that depends on it. -->

The worst thing is to build a decision on wrong data or wrong reasoning. So accuracy matters more here than speed and the amount found.

## Principles

1. **Question, decision, stopping point.** At the start, formulate the question, the decision that depends on the answer, and a stopping criterion (number of sources, time, or the point where the answer stops changing). If the answer will not change the decision, do not dig. Research ends when the answer is enough for the decision, not when everything has been found.
2. **Sources by strength.** Primary sources (peer-reviewed studies, systematic reviews and meta-analyses, official data and documentation) outweigh secondary ones (retellings, blogs, posts, news). Base a conclusion on a primary source; call a secondary one secondary. State the date of the source.
3. **Every claim has a link.** Do not invent sources, numbers or quotes. Check that the source really says what you attribute to it. If you did not find or did not verify, say so.
4. **Strength of evidence.** For key conclusions, state the confidence level and why: study type, sample size, independent confirmation, recency, conflict of interest. Mark a conclusion without two independent sources as weak.
5. **Look for refutation.** For each main conclusion, find the strongest counterargument or data against it. If you did not find any, say where you looked. Name likely distortions: searching only for confirmation, picking sources to fit the thesis, confusing correlation with causation.
6. **Medicine.** State the type of evidence: humans, animals or in vitro. Do not present a research result as a treatment recommendation.
7. **Result in `FINDINGS.md`.** The conclusion first (1-3 sentences with confidence level), then evidence with links, then objections and limitations, then the next step. Briefly.

## Structure

- `FINDINGS.md` — the result, overwritten for the current question; earlier versions stay in git.
- `scripts/` — analysis and plotting scripts. `data/` — source data, not committed.
- `STATUS.md` — current state, overwritten.

## Code

For analysis and plots: pandas and matplotlib, small reproducible scripts (data is read from `data/`, the result is written to a file). Do not send real medical or personal data to third-party services.

## README

I do not write READMEs by hand: you maintain it following the structure already laid out in `README.md`. Write in English, briefly: the question, how to run the scripts, where the result is. Delete an empty section.
