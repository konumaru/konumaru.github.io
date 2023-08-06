default: help

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: hugo
run: # Run local hugo server with docker.
	docker run --rm -it \
		-v $(PWD):/src \
		-p 1313:1313 \
		klakegg/hugo:latest \
		server -D

.PHONY: new-post
new-post: # Create a new post.
	hugo new posts/new-post.md

.PHONY: new-post-dir
new-post-dir: # Create a new post using image.
	hugo new --kind post-bundle posts/new-post


.PHONY: update
update:
	git submodule update --init --recursive
