.PHONY: hugo
run-server: ## run local hugo server with docker
	docker run --rm -it \
		-v $(PWD):/src \
		-p 1313:1313 \
		klakegg/hugo:latest \
		server -D

.PHONY: new-post
new-post: ## create a new post
	hugo new posts/new-post.md

.PHONY: new-post-dir
new-post-dir: ## create a new post using image
	hugo new --kind post-bundle posts/new-post
