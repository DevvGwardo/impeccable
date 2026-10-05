#!/usr/bin/env bash
# Structural checks for the packaged skill. Run by sync-upstream.sh and CI.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
fail=0

# Unrendered build placeholders mean upstream shipped a broken provider build.
if grep -rnE '\{\{[a-z_]+\}\}' SKILL.md reference; then
  echo "check: unrendered {{placeholders}} above" >&2; fail=1
fi

# Every relative .md link in SKILL.md and reference/ must resolve.
while IFS=: read -r file link; do
  target="${link%%#*}"
  [ -e "$(dirname "$file")/$target" ] || { echo "check: $file -> $target is missing" >&2; fail=1; }
done < <(grep -oE '\]\([^)#:]+\.md[^)]*\)' -r SKILL.md reference | sed -E 's/\]\(([^)]*)\)/\1/')

# The launcher must be present and executable.
[ -x scripts/impeccable ] || { echo "check: scripts/impeccable missing or not executable" >&2; fail=1; }

grep -q '^> \*\*On Hermes:\*\*' SKILL.md || { echo "check: Hermes overlay not applied" >&2; fail=1; }

# Hermes' own install-time scanner, when a local hermes-agent checkout is available.
agent="${HERMES_AGENT_DIR:-$HOME/.hermes/hermes-agent}"
py="$agent/venv/bin/python"; [ -x "$py" ] || py="$agent/.venv/bin/python"
if [ -x "$py" ]; then
  stage="$(mktemp -d)"; trap 'rm -rf "$stage"' EXIT
  cp -R SKILL.md reference scripts "$stage/"
  (cd "$agent" && "$py" - "$stage" <<'PY') || fail=1
import sys
from pathlib import Path
from tools.skills_guard import scan_skill, should_allow_install
ok, why = should_allow_install(scan_skill(Path(sys.argv[1]), "community"))
print(f"check: hermes skills_guard: {why or 'allowed'}")
sys.exit(0 if ok else 1)
PY
fi

[ "$fail" -eq 0 ] && echo "check: ok"
exit "$fail"
