all: run

run: watch serve

build:
	node_modules/.bin/coffee -co public/javascripts source/javascripts
	node_modules/.bin/stylus -o public/stylesheets source/stylesheets
	node_modules/.bin/jade -Po public source/templates

deploy: build push

push:
	git checkout gh-pages
	git commit public -m "building site"
	git push origin gh-pages
	git checkout master

serve:
	node_modules/.bin/http-server -p 5000

watch:
	node_modules/.bin/coffee -wco public/javascripts source/javascripts &
	node_modules/.bin/stylus -w -o public/stylesheets source/stylesheets &
	node_modules/.bin/jade -wPo public source/templates &

.PHONY: all run build deploy push serve watch
