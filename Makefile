default: help

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: clean
clean: # Clean up the build directory.
	rm -rf public

.PHONY: clone-theme
clone-theme: # Clone the PaperMod theme at the commit pinned in .papermod-version.
	rm -rf themes/PaperMod
	git init -q themes/PaperMod
	git -C themes/PaperMod remote add origin https://github.com/adityatelange/hugo-PaperMod.git
	git -C themes/PaperMod fetch -q --depth=1 origin $$(cat .papermod-version)
	git -C themes/PaperMod checkout -q FETCH_HEAD

.PHONY: run
run: # Run the local Hugo server with drafts and live reload.
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
resume-pdf: resume-html # Print static/resume/{,en/}index.html to static/resume/{,en/}resume.pdf.
	node resume/pdf.mjs

.PHONY: resume-lint
resume-lint: # Lint the resume markdown with textlint.
	npx textlint --fix resume/README.md

