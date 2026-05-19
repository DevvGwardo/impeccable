---
name: impeccable
description: "Comprehensive frontend design skill — 23 commands for shaping, auditing, polishing, and refining UI. Use when the user wants to design, redesign, shape, critique, audit, polish, clarify, distill, harden, optimize, adapt, animate, colorize, extract, or improve a frontend interface. Covers websites, landing pages, dashboards, product UI, app shells, components, forms, settings, onboarding, empty states. Handles UX review, visual hierarchy, info architecture, cognitive load, accessibility, performance, responsive behavior, theming, anti-patterns, typography, fonts, spacing, layout, alignment, color, motion, micro-interactions, UX copy, error states, edge cases, i18n, and reusable design systems/tokens. Also use for bland designs needing boldness, loud designs needing quiet, live browser iteration, or ambitious visual effects. Not for backend-only or non-UI tasks."
author: Paul Bakaus (pbakaus/impeccable) — ported to Hermes Agent
license: Apache 2.0
metadata:
  hermes:
    tags: [design, frontend, ui, ux, typography, accessibility, anti-patterns, css]
    related_skills: [claude-design, sketch, pixel-art, popular-web-designs, nano-banana]
---

# Impeccable — Frontend Design Skill

Designs and iterates production-grade frontend interfaces. Real working code, committed design choices, exceptional craft.

Based on [pbakaus/impeccable](https://github.com/pbakaus/impeccable) (Apache 2.0), which builds on Anthropic's frontend-design skill.

## Setup

Before any design work or file edits:

1. **Read context** — Check for PRODUCT.md / DESIGN.md in the project root. If PRODUCT.md is missing or placeholder (<200 chars), suggest the user run `impeccable:teach` first.
2. **Identify register** — Every design task is **brand** (marketing, landing, campaign, portfolio: design IS the product) or **product** (app UI, admin, dashboard, tool: design SERVES the product). Identify before designing.
3. **Load register reference** — Use the brand or product reference from this skill's reference files depending on the register.

## Commands

When the user invokes a specific impeccable command (e.g. "audit this page", "polish the checkout"), follow the pattern: `impeccable:<command> [target]`. Each command has a reference file in this skill's reference directory.

| Command | Category | Description |
|---------|----------|-------------|
| `impeccable:craft [feature]` | Build | Full shape-then-build flow with visual iteration |
| `impeccable:teach` | Build | One-time setup: gather design context, write PRODUCT.md and DESIGN.md |
| `impeccable:document` | Build | Generate DESIGN.md from existing project code |
| `impeccable:extract [target]` | Build | Pull reusable components and tokens into the design system |
| `impeccable:shape [feature]` | Build | Plan UX/UI before writing code |
| `impeccable:critique [target]` | Evaluate | UX design review: hierarchy, clarity, emotional resonance |
| `impeccable:audit [target]` | Evaluate | Run technical quality checks (a11y, performance, responsive) |
| `impeccable:polish [target]` | Refine | Final pass, design system alignment, and shipping readiness |
| `impeccable:bolder [target]` | Refine | Amplify boring designs |
| `impeccable:quieter [target]` | Refine | Tone down overly bold designs |
| `impeccable:distill [target]` | Refine | Strip to essence |
| `impeccable:harden [target]` | Refine | Error handling, i18n, text overflow, edge cases |
| `impeccable:onboard [target]` | Refine | First-run flows, empty states, activation paths |
| `impeccable:animate [target]` | Enhance | Add purposeful motion |
| `impeccable:colorize [target]` | Enhance | Introduce strategic color |
| `impeccable:typeset [target]` | Enhance | Fix font choices, hierarchy, sizing |
| `impeccable:layout [target]` | Enhance | Fix layout, spacing, visual rhythm |
| `impeccable:delight [target]` | Enhance | Add moments of joy |
| `impeccable:overdrive [target]` | Enhance | Add technically extraordinary effects |
| `impeccable:clarify [target]` | Fix | Improve unclear UX copy |
| `impeccable:adapt [target]` | Fix | Adapt for different devices |
| `impeccable:optimize [target]` | Fix | Performance improvements |
| `impeccable:live` | Iterate | Visual variant mode: iterate on elements in the browser |

### Routing

- **No target specified**: Render the command table grouped by category, ask what they'd like to do.
- **Command matches**: Load its reference file from this skill's reference/ directory and follow its instructions.
- **No match but design-related**: Apply the shared design laws and register reference directly.

## Shared Design Laws

Apply to every design, both registers. Match implementation complexity to the aesthetic vision. Vary across projects; never converge on the same choices.

### Color

- Use OKLCH. Reduce chroma as lightness approaches 0 or 100; high chroma at extremes looks garish.
- Never use `#000` or `#fff`. Tint every neutral toward the brand hue (chroma 0.005–0.01 is enough).
- Pick a **color strategy** before picking colors. Four steps on the commitment axis:
  - **Restrained**: tinted neutrals + one accent ≤10%. Product default; brand minimalism.
  - **Committed**: one saturated color carries 30–60% of the surface. Brand default for identity-driven pages.
  - **Full palette**: 3–4 named roles, each used deliberately. Brand campaigns; product data viz.
  - **Drenched**: the surface IS the color. Brand heroes, campaign pages.
- The "one accent ≤10%" rule is Restrained only. Committed / Full Palette / Drenched exceed it on purpose.

### Theme

Dark vs. light is never a default. Not dark "because tools look cool dark." Not light "to be safe."

Before choosing, write one sentence of physical scene: who uses this, where, under what ambient light, in what mood. If the sentence doesn't force the answer, it's not concrete enough. Add detail until it does.

"Observability dashboard" does not force an answer. "SRE glancing at incident severity on a 27-inch monitor at 2am in a dim room" does.

### Typography

- Cap body line length at 65–75ch.
- Hierarchy through scale + weight contrast (≥1.25 ratio between steps). Avoid flat scales.

### Layout

- Vary spacing for rhythm. Same padding everywhere is monotony.
- Cards are the lazy answer. Use them only when they're truly the best affordance. Nested cards are always wrong.
- Don't wrap everything in a container. Most things don't need one.

### Motion

- Don't animate CSS layout properties.
- Ease out with exponential curves (ease-out-quart / quint / expo). No bounce, no elastic.

### Absolute Bans (Anti-Patterns)

Match-and-refuse. If you're about to write any of these, rewrite with different structure.

- **Side-stripe borders.** `border-left` or `border-right` >1px as a colored accent on cards, list items, callouts, or alerts. Use full borders, background tints, leading numbers/icons, or nothing.
- **Gradient text.** `background-clip: text` + gradient. Decorative, never meaningful. Use single solid color. Emphasis via weight or size.
- **Glassmorphism as default.** Blurs and glass cards used decoratively. Rare and purposeful, or nothing.
- **The hero-metric template.** Big number, small label, supporting stats, gradient accent. SaaS cliché.
- **Identical card grids.** Same-sized cards with icon + heading + text, repeated endlessly.
- **Modal as first thought.** Modals are usually laziness. Exhaust inline/progressive alternatives first.

### Copy

- Every word earns its place. No restated headings, no intros that repeat the title.
- **No em dashes.** Use commas, colons, semicolons, periods, or parentheses.

### The AI Slop Test

If someone could look at this interface and say "AI made that" without doubt, it's failed.

**Category-reflex check** — two altitudes:
- **First-order:** if someone could guess the theme + palette from the category alone ("observability → dark blue", "healthcare → white + teal", "finance → navy + gold", "crypto → neon on black"), it's the training-data reflex. Rework the scene sentence and color strategy until the answer isn't obvious from the domain.
- **Second-order:** if someone could guess the aesthetic family from category-plus-anti-references ("AI workflow tool that's not SaaS-cream → editorial-typographic", "fintech that's not navy-and-gold → terminal-native dark mode"), it's the trap one tier deeper. The first reflex was avoided; the second wasn't. Rework until both answers are not obvious.

## Reference Files

Detailed reference files are available in this skill's reference/ directory for each command and design domain. Load them with `skill_view(name='impeccable', file_path='reference/<name>.md')`.

Key design domain references (load for deep dives):
- `reference/brand.md` — Brand register: marketing, landing, campaign pages
- `reference/product.md` — Product register: app UI, dashboards, tools
- `reference/typography.md` — Type systems, font pairing, modular scales, OpenType
- `reference/color-and-contrast.md` — OKLCH, tinted neutrals, dark mode, accessibility
- `reference/spatial-design.md` — Spacing systems, grids, visual hierarchy
- `reference/motion-design.md` — Easing curves, staggering, reduced motion
- `reference/interaction-design.md` — Forms, focus states, loading patterns
- `reference/responsive-design.md` — Mobile-first, fluid design, container queries
- `reference/ux-writing.md` — Button labels, error messages, empty states
- `reference/cognitive-load.md` — Reduce cognitive overhead in interfaces
- `reference/heuristics-scoring.md` — Nielsen-style heuristic evaluation rubric

Command-specific references (load on matching command):
- `reference/craft.md` — Full shape-then-build flow
- `reference/shape.md` — UX/UI planning before code
- `reference/teach.md` — Setting up PRODUCT.md and DESIGN.md
- `reference/document.md` — Generating DESIGN.md from existing code
- `reference/extract.md` — Pulling tokens into design system
- `reference/critique.md` — UX design review
- `reference/audit.md` — Technical quality checks
- `reference/polish.md` — Final quality pass
- `reference/bolder.md` — Amplifying safe designs
- `reference/quieter.md` — Toning down loud designs
- `reference/distill.md` — Stripping to essence
- `reference/harden.md` — Production readiness
- `reference/onboard.md` — First-run flows and empty states
- `reference/animate.md` — Purposeful animation
- `reference/colorize.md` — Strategic color introduction
- `reference/typeset.md` — Typography fixes
- `reference/layout.md` — Layout and spacing fixes
- `reference/delight.md` — Personality and memorable touches
- `reference/overdrive.md` — Pushing past conventional limits
- `reference/clarify.md` — UX copy improvements
- `reference/adapt.md` — Device adaptation
- `reference/optimize.md` — UI performance
- `reference/live.md` — Browser variant iteration

## CLI Tool

Impeccable also ships a standalone CLI for detecting UI anti-patterns without an AI harness:

```bash
npx impeccable detect src/                   # scan a directory
npx impeccable detect index.html             # scan an HTML file
npx impeccable detect https://example.com    # scan a URL (requires Puppeteer)
npx impeccable detect --fast --json .        # regex-only, JSON output
```

Scans HTML, CSS, JSX, TSX, Vue, Svelte files for 25+ anti-patterns. Exit code 0 = clean, 2 = issues found. Requires Node.js 18+.

## Source

Original: [github.com/pbakaus/impeccable](https://github.com/pbakaus/impeccable)
Website: [impeccable.style](https://impeccable.style)
