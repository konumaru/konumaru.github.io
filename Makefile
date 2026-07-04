default: help

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: clean
clean: # Clean up the build directory.
	rm -rf public

.PHONY: clone-theme
clone-theme: # Clone the PaperMod theme.
	rm -rf themes/PaperMod
	git clone --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod

.PHONY: run
run: # Run local hugo server with docker.
	hugo server -D --bind 0.0.0.0

.PHONY: new-post
new-post: # Create a new post.
	hugo new posts/new-post.md

.PHONY: new-post-dir
new-post-dir: # Create a new post using image.
	hugo new --kind post-bundle posts/new-post

.PHONY: build
build: # Build static site.
	hugo --minify

.PHONY: resume
resume: resume-html resume-pdf # Build resume web pages (ja/en) and PDFs into static/resume/.

.PHONY: resume-html
resume-html: # Generate static/resume/{,en/}index.html from resume/README{,.en}.md.
	node resume/build.mjs

.PHONY: resume-pdf
resume-pdf: # Generate static/resume/{,en/}resume.pdf from resume/README{,.en}.md.
	npx -y md-to-pdf@5 resume/README.md --stylesheet resume/styles/markdown-theme.css \
		--launch-options '{"args":["--no-sandbox","--font-render-hinting=none"]}' \
		--pdf-options '{"format":"A4","margin":{"top":"15mm","bottom":"15mm","left":"15mm","right":"15mm"},"printBackground":true}'
	mv resume/README.pdf static/resume/resume.pdf
	npx -y md-to-pdf@5 resume/README.en.md --stylesheet resume/styles/markdown-theme.css \
		--launch-options '{"args":["--no-sandbox","--font-render-hinting=none"]}' \
		--pdf-options '{"format":"A4","margin":{"top":"15mm","bottom":"15mm","left":"15mm","right":"15mm"},"printBackground":true}'
	mkdir -p static/resume/en
	mv resume/README.en.pdf static/resume/en/resume.pdf

.PHONY: resume-lint
resume-lint: # Lint the resume markdown with textlint.
	npx textlint --fix resume/README.md

