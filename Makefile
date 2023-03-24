image-run-sheriff-server:
	docker run --rm -p 8080:8080 --env-file .env $$(whoami)/sheriff

image-run-validate-config:
	docker run --rm --env-file .env $$(whoami)/sheriff node lib/permissions/run.js

image-run-generate-config:
	docker run --rm --env-file .env $$(whoami)/sheriff node lib/permissions/generate.js

image-build:  
	docker build -t $$(whoami)/sheriff .

image-push: # pushes image to configured container regtistry
	docker push $$(whoami)/sheriff

prettify:
	docker run --rm -w /usr/src/app -v $$(pwd):/usr/src/app node:alpine /bin/sh -c "yarn install --frozen-lockfile && yarn prettier --write \"src/**/*.{ts,tsx}\""