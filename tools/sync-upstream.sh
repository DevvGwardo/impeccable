#!/usr/bin/env bash
# Rebuild the skill from upstream pbakaus/impeccable's generated Hermes output,
# then apply this repo's Hermes overlay (tools/overlay.py).
#
#   tools/sync-upstream.sh              # latest skill-v* release
#   tools/sync-upstream.sh skill-v4.5.0 # a specific release tag
#
# Only SKILL.md, reference/, scripts/, LICENSE and NOTICE.md are replaced.
# README.md, docs/ and tools/ belong to this repo.
set -euo pipefail

UPSTREAM="${IMPECCABLE_UPSTREAM:-https://github.com/pbakaus/impeccable}"
root="$(cd "$(dirname "$0")/.." && pwd)"

ref="${1:-}"
if [ -z "$ref" ]; then
  ref="$(git ls-remote --tags --refs "$UPSTREAM" 'skill-v*' \
    | sed 's|.*refs/tags/||' | sort -V | tail -1)"
fi
[ -n "$ref" ] || { echo "sync: no skill-v* tag found on $UPSTREAM" >&2; exit 1; }

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
git -c advice.detachedHead=false clone -q --depth 1 --branch "$ref" "$UPSTREAM" "$work/upstream"

src="$work/upstream/.hermes/skills/impeccable"
[ -f "$src/SKILL.md" ] || { echo "sync: $ref has no .hermes/skills/impeccable build" >&2; exit 1; }

rm -rf "$root/SKILL.md" "$root/reference" "$root/scripts"
cp -R "$src/." "$root/"
cp "$work/upstream/LICENSE" "$work/upstream/NOTICE.md" "$root/"

commit="$(git -C "$work/upstream" rev-parse --short HEAD)"
printf '%s %s\n' "$ref" "$commit" > "$root/UPSTREAM"

python3 "$root/tools/overlay.py" "$root/SKILL.md"
"$root/tools/check.sh"

echo "sync: $ref ($commit) applied"
