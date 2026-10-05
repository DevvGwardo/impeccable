#!/usr/bin/env python3
"""Apply this repo's Hermes overlay to an upstream-generated SKILL.md.

Idempotent: running it twice leaves the file unchanged.
"""
import sys
from pathlib import Path

FRONTMATTER_EXTRA = """\
author: Paul Bakaus (pbakaus/impeccable), Hermes packaging by DevvGwardo
metadata:
  hermes:
    tags: [design, frontend, ui, ux, typography, accessibility, anti-patterns, css]
    related_skills: [claude-design, popular-web-designs, sketch, pixel-art, nano-banana]
"""

SETUP_NOTE = """\
> **On Hermes:** `<skill-base-dir>` is the `skill_dir` field that `skill_view(name='impeccable')` returns. Use that absolute path for every `scripts/impeccable` command, and invoke it through `sh` (`sh <skill_dir>/scripts/impeccable context`) because hub installs on older Hermes releases drop the launcher's executable bit; the `.hermes/skills/impeccable/scripts` fallback below only holds for a project-local install. Open reference files with `skill_view(name='impeccable', file_path='reference/<name>.md')`. Hermes has no edit-hook surface, so the `hooks` command cannot auto-run the detector after edits.
"""

# Hermes' system-prompt skill index keeps only the first 57 chars of a description
# (agent/skill_utils.py SKILL_PROMPT_DESC_LIMIT), so lead with the routing signal.
DESCRIPTION_LEAD = "Frontend UI design, critique, audit, polish. "

MARKER = "> **On Hermes:**"


def main(path: str) -> None:
    p = Path(path)
    text = p.read_text()
    if MARKER in text:
        return

    if not text.startswith("---\n"):
        sys.exit(f"overlay: {path} has no frontmatter")
    end = text.index("\n---\n", 4)
    front, body = text[4:end + 1], text[end + 5:]
    if "metadata:" in front:
        sys.exit("overlay: upstream frontmatter now has metadata:, merge by hand")
    if "\ndescription: " not in "\n" + front:
        sys.exit("overlay: no plain description: line in upstream frontmatter")
    front = ("\n" + front).replace("\ndescription: ", "\ndescription: " + DESCRIPTION_LEAD, 1)[1:]
    front += FRONTMATTER_EXTRA

    heading = "## Setup\n\n"
    if heading not in body:
        sys.exit("overlay: no '## Setup' section in upstream SKILL.md")
    body = body.replace(heading, heading + SETUP_NOTE + "\n", 1)

    p.write_text(f"---\n{front}---\n{body}")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "SKILL.md")
