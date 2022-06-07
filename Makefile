run-server:
	docker run --rm -it \
		-v $(PWD):/src \
		-p 1313:1313 \
		klakegg/hugo:latest \
		server


new-post:
	hugo new posts/new-post.md

new-post-use-img:
	hugo new --kind post-bundle posts/new-post
