all: run

run: watch serve

build:
	node_modules/.bin/coffee -c javascripts
	node_modules/.bin/stylus stylesheets
	node_modules/.bin/jade -Po . templates

deploy: build push

push:
	git checkout gh-pages
	git commit javascripts/*.js stylesheets/*.css index.html -m "building site"
	git push origin gh-pages
	git checkout master

serve:
	node_modules/.bin/http-server -p 5000 .

watch:
	node_modules/.bin/coffee -wc javascripts &
	node_modules/.bin/stylus -w stylesheets &
	node_modules/.bin/jade -wPo . templates &

.PHONY: all run build deploy push serve watch
