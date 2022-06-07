run-server:
	docker run --rm -it \
		-v $(PWD):/src \
		-p 1313:1313 \
		klakegg/hugo:latest \
		server
