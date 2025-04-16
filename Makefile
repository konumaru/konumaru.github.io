default: help

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: update
update: # Update the git submodules.
	git submodule update --init --recursive

.PHONY: run
run: # Run local hugo server with docker.
	docker run --rm -it -v $(PWD):/src -p 1313:1313 hugomods/hugo:reg-ci-0.145.0 hugo server -D --bind 0.0.0.0

.PHONY: new-post
new-post: # Create a new post.
	docker run --rm -it -v $(PWD):/src hugomods/hugo:reg-ci-0.145.0 hugo new posts/new-post.md

.PHONY: new-post-dir
new-post-dir: # Create a new post using image.
	docker run --rm -it -v $(PWD):/src hugomods/hugo:reg-ci-0.145.0 hugo new --kind post-bundle posts/new-post

.PHONY: build
build: # Build static site.
	docker run --rm -it -v $(PWD):/src hugomods/hugo:reg-ci-0.145.0 hugo --minify

