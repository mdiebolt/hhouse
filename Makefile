all: run

run: watch serve

serve:
	node_modules/.bin/http-server -p 5000

watch:
	node_modules/.bin/coffee -wco public/javascripts source/javascripts &
	node_modules/.bin/stylus -w -o public/stylesheets source/stylesheets &
	node_modules/.bin/jade -wPo public source/templates &

.PHONY: all run serve watch
