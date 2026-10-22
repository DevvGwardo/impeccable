# Impeccable for Hermes Agent

<p align="center">
  <img src="docs/banner.png" alt="Impeccable. Good taste. Working code. A frontend design skill for Hermes Agent. Shape, critique, refine." width="100%">
</p>

<!-- docs/banner.png is rendered from docs/banner.html at 1600x800. See docs/BRAND.md. -->

**Good taste. Working code.**

[Impeccable](https://github.com/pbakaus/impeccable), Paul Bakaus's frontend design skill, packaged for [Hermes Agent](https://github.com/NousResearch/hermes-agent). Shape the experience, critique the decisions, and refine the details with real working code and a mechanical anti-pattern detector.

[Install](#install) · [How it works](#how-it-works) · [Commands](#use) · [Design modes](#four-modes-one-design-skill) · [Hermes packaging](#what-this-package-adds)

## Install

```bash
dest="${HERMES_HOME:-$HOME/.hermes}/skills/creative/impeccable"
git clone https://github.com/DevvGwardo/impeccable /tmp/impeccable
mkdir -p "$dest" && cp -R /tmp/impeccable/{SKILL.md,reference,scripts} "$dest/"
```

Use the manual copy. Hermes' official `impeccable` catalog entry captures every hub form of this repo's identifier (`DevvGwardo/impeccable/`, `github/...`, the GitHub URL), so `hermes skills install` gets upstream's bundle without this overlay. Hub installs also drop the launcher's executable bit.

`hermes skills install impeccable` installs upstream's Hermes bundle from pbakaus/impeccable directly, without the overlay described above. So does upstream's own installer: `npx impeccable install --providers=hermes --scope=global`.

The first command that needs the engine downloads a self-contained binary for your platform from upstream's GitHub releases, verifies it against its `.sha256`, and caches it in `~/.impeccable` (override with `IMPECCABLE_HOME`, or point `IMPECCABLE_BIN` at a preinstalled engine). No Node is required.

A project-scoped install goes in `<project>/.hermes/skills/impeccable/` instead; run `hermes skills trust` once from the project root, since Hermes gates project-local skills behind a per-repo trust decision.

## How it works

<p align="center">
  <img src="docs/images/workflow.png" alt="An example Impeccable workflow: set context with init and document; shape the work with shape; evaluate with critique and audit; refine with polish, adapt, and optimize. Iterate as needed." width="100%">
</p>

Start with the pass your project needs. This is an example workflow, not an automatic pipeline:

1. **Set context.** `init` captures product context in PRODUCT.md. For existing projects, `document` generates DESIGN.md from the code.
2. **Shape the work.** `shape` plans UX/UI before implementation.
3. **Evaluate.** `critique` reviews UX decisions. `audit` checks accessibility, performance, and responsive behavior.
4. **Refine and verify.** Choose focused passes such as `polish`, `adapt`, or `optimize`, then check the result.

## Use

Ask for design work in plain language, or name a command: `/impeccable audit the checkout page`. With no argument the skill shows a menu based on your project's state.

For example:

```text
Shape an onboarding flow for a first-time user.
Critique the hierarchy on this dashboard.
Audit the checkout page for accessibility and responsive issues.
Polish this settings screen before shipping.
```

### Command reference

| Command | Category | Description |
|---|---|---|
| `init` | Build | Capture durable product context in PRODUCT.md (`teach` is an alias) |
| `document` | Build | Generate DESIGN.md from existing project code |
| `shape [feature]` | Build | Plan UX/UI before writing code |
| `extract [target]` | Build | Pull reusable tokens and components into the design system |
| `critique [target]` | Evaluate | UX design review with heuristic scoring |
| `audit [target]` | Evaluate | Technical quality checks (a11y, perf, responsive) |
| `polish [target]` | Refine | Final quality pass before shipping |
| `bolder` / `quieter` / `distill` | Refine | Amplify, tone down, or strip to essence |
| `harden [target]` | Refine | Errors, i18n, overflow, edge cases |
| `onboard [target]` | Refine | First-run flows, empty states, activation |
| `animate` / `colorize` / `typeset` / `layout` | Enhance | Motion, color, typography, spacing and rhythm |
| `delight` / `overdrive` | Enhance | Personality; technically extraordinary effects |
| `clarify` / `adapt` / `optimize` | Fix | UX copy, device adaptation, UI performance |
| `live` | Iterate | Pick elements in the browser and iterate on variants |
| `generate [n] [action] [element]` | Iterate | Variants of a named element in the live browser |
| `doctor` | Maintain | Report and repair drift in PRODUCT.md, DESIGN.md and config |

## Four modes, one design skill

<p align="center">
  <img src="docs/images/design-modes.png" alt="Four design modes: Persuade for landing pages, marketing, and pricing; Operate for dashboards, tools, and app UI; Read for docs, guides, and articles; Experience for portfolios, galleries, and showcases." width="100%">
</p>

The mode follows what the visitor needs to do, not the product category:

| Mode | Visitor's goal | Typical surfaces |
|---|---|---|
| **Persuade** | Decide and act | Landing pages, marketing, pricing |
| **Operate** | Complete a task | App UI, dashboards, tools |
| **Read** | Understand something | Docs, guides, articles |
| **Experience** | Explore the work itself | Portfolios, galleries, showcases |

iOS and Android projects get native-platform references. The images above are conceptual illustrations, not captured product output.

### Check the details

Hermes has no edit-hook surface, so the `hooks` command (auto-running the detector after each UI edit) does nothing here. The skill runs the detector itself at the end of a change, and you can run it by hand:

```bash
sh ~/.hermes/skills/creative/impeccable/scripts/impeccable detect --json src/
```

## What this package adds

This repo tracks upstream's generated Hermes build release by release (see [`UPSTREAM`](UPSTREAM) for the pinned tag) and adds a small Hermes overlay on top:

- `metadata.hermes` tags and related skills.
- A description that leads with its routing signal, because Hermes' system-prompt skill index keeps only the first 57 characters.
- A setup note telling the agent to resolve `scripts/impeccable` from the `skill_dir` that `skill_view` returns, so global installs work (upstream's fallback path assumes a project-local install), and to call it through `sh`, since Hermes hub installs drop its executable bit.

## Updating

```bash
tools/sync-upstream.sh               # latest upstream skill-v* release
tools/sync-upstream.sh skill-v4.5.0  # a specific release
```

The script replaces `SKILL.md`, `reference/`, `scripts/`, `LICENSE` and `NOTICE.md` from upstream's `.hermes/skills/impeccable/` build at that tag, reapplies `tools/overlay.py`, and runs `tools/check.sh` (unrendered placeholders, broken reference links, the launcher, and Hermes' own `skills_guard` install scan when a local `hermes-agent` checkout exists). A weekly GitHub Action does the same and opens a pull request when upstream ships a new release.

## License

Apache 2.0, same as upstream. See [LICENSE](LICENSE) and [NOTICE.md](NOTICE.md).

## Credits

- [Paul Bakaus](https://github.com/pbakaus): Impeccable
- [Anthropic](https://www.anthropic.com): the frontend-design skill it builds on
- [Nous Research](https://nousresearch.com): Hermes Agent

Brand assets, editable sources, and a local visual preview live in [`docs/`](docs/BRAND.md). The conceptual illustrations and infographics are AI-generated; the banner typography and layout are HTML/CSS.
