# AGENTS.md

Guidance for AI coding agents working with code in this repository.

## Commands

```bash
make run          # Local server with live reload
make build        # Production build with minification
make new-post     # Create single-file post
make new-post-dir # Create post bundle with images/
make clone-theme  # Clone PaperMod theme (required before first build)
make resume       # Regenerate static/resume/{index.html,resume.pdf} from resume/README.md
```

## Architecture

Hugo static site (https://konumaru.com/) with PaperMod theme. Key points:

- **Theme is a plain clone pinned by commit**: `themes/PaperMod` is gitignored; `make clone-theme` (also used by CI) checks out the commit in `.papermod-version`. To upgrade the theme, bump that hash and verify post pages locally — an unpinned theme once broke the live site when PaperMod renamed `.post-content` to `.md-content`.
- **Hugo version is pinned in CI** (`gh-pages.yml`) — keep it in sync with the local Hugo when bumping
- **Content structure**: `content/posts/category/post.md` or `content/posts/category/post-dir/index.md` with `images/`
- **Custom features**: Mermaid diagrams (`layouts/_markup/render-codeblock-mermaid.html` + loader in `layouts/_partials/extend_post_content.html`, mermaid version pinned there), related/support sections via the same PaperMod `extend_post_content` hook. Do not fork theme templates like `single.html`; use PaperMod's extend hooks. Do not put per-page logic in `extend_footer.html` — it renders inside a `partialCached` footer.
- **CI/CD**: GitHub Actions auto-deploys to GitHub Pages on push to main
- **No testing framework** - validation through Hugo build only
- **Resume** (`konumaru.com/resume/`): source is `resume/README.md` + `resume/styles/markdown-theme.css` (shared by web & PDF). `make resume` renders the self-contained `static/resume/index.html` (web) and `static/resume/resume.pdf` (via `md-to-pdf`), which Hugo copies verbatim from `static/`. **The deploy workflow (`gh-pages.yml`) regenerates the resume from source on every push** (Node + `fonts-noto-cjk` + `make resume`), so the live PDF/HTML always match `resume/README.md` — no cron, no manual rebuild required. Committed `static/resume/` artifacts are a convenience/fallback; run `make resume` locally to preview. The separate `resume-reminder.yml` workflow only opens a half-yearly *issue* reminder (it does not build anything).
