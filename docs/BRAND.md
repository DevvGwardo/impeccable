# Impeccable for Hermes Agent · Visual identity

The identity keeps the upstream project name and makes this package’s Hermes
context explicit. It changes presentation only, not skill behavior or commands.
Paul Bakaus’s Impeccable and Nous Research’s Hermes Agent retain their credits;
the package mark is not an official logo for either project.

## Direction

**Good taste. Working code.** A warm editorial identity built around deliberate
hierarchy, tactile paper-like imagery, fine rules, and a restrained vermilion
accent. Avoid neon grids, glowing gradients, fake dashboards, performance claims,
and command counts that become stale after an upstream sync.

| Token | Value | Use |
|---|---|---|
| Paper | `#F3EFE5` | Background |
| Ink | `#20221E` | Primary text and rules |
| Vermilion | `#B93927` | Emphasis and links |
| Olive | `#666B45` | Secondary illustration accent |
| Muted | `#62635A` | Secondary text |

Display type uses Georgia; supporting text uses Avenir Next, Avenir, then Segoe UI
or the system sans-serif fallback. No remote font request is required. The
committed PNG preserves the rendered typography across GitHub clients.

## Assets

| File | Purpose | Source |
|---|---|---|
| `banner.png` | README hero, 1600 × 800 | Browser render of `banner.html` |
| `banner.html`, `brand.css` | Editable banner layout, copy, and shared tokens | HTML/CSS |
| `images/mark.svg` | Bracketed “i” package mark | Editable SVG |
| `images/hero-art.webp` | Tactile interface-panel illustration | AI-generated, locally optimized |
| `images/workflow.png` | Context → shape → evaluate → refine infographic | AI-generated |
| `images/design-modes.png` | Persuade, Operate, Read, Experience infographic | AI-generated |
| `brand.html` | Responsive preview and accessible text explanations | HTML/CSS |

The illustrations are conceptual, not screenshots or promises of specific
generated results. The workflow is an example, not an automatic sequence.
Infographic facts are also available as README and preview-page text.

## Preview and regenerate the banner

Open `docs/brand.html` directly in a browser. All assets are local; no server,
JavaScript build, or package installation is required.

From the repository root, with `agent-browser` available:

```bash
root="$(pwd)"
export AGENT_BROWSER_SESSION="${AGENT_BROWSER_SESSION:-$(agent-browser session id --scope worktree --prefix impeccable-brand)}"
agent-browser set viewport 1600 800
agent-browser open "file://$root/docs/banner.html"
agent-browser wait --fn 'Array.from(document.images).every(img => img.complete && img.naturalWidth > 0)'
agent-browser screenshot "$root/docs/banner.png"
agent-browser close
```

The illustration files are frozen assets. Editing HTML changes the banner copy
and layout, not the infographic text baked into the generated images. Review
infographics against `SKILL.md` when updating them. Normal upstream syncs leave
`README.md` and `docs/` intact.
