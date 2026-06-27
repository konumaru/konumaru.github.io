# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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

- **Theme is a Git submodule** at `themes/PaperMod` - run `git submodule update --init` if missing
- **Submodule may fail to clone** - Makefile's `clone-theme` command handles this, CI/CD also clones dynamically
- **Content structure**: `content/posts/category/post.md` or `content/posts/category/post-dir/index.md` with `images/`
- **Custom features**: Mermaid diagrams (`layouts/_default/_markup/render-codeblock-mermaid.html`), modified post templates
- **CI/CD**: GitHub Actions auto-deploys to GitHub Pages on push to main
- **No testing framework** - validation through Hugo build only
- **Resume** (`konumaru.com/resume/`): source is `resume/README.md` + `resume/styles/markdown-theme.css` (shared by web & PDF). `make resume` renders the self-contained `static/resume/index.html` (web) and `static/resume/resume.pdf` (via `md-to-pdf`), which Hugo copies verbatim from `static/`. **CI does not rebuild the resume** — after editing `resume/README.md`, run `make resume` and commit the regenerated `static/resume/` outputs, or the live page stays stale. The `resume-reminder.yml` workflow opens a half-yearly update issue.
