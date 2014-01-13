watch:
	webpack src/index.coffee build/pack.js -w
	
watch-p:
	webpack src/index.coffee build/pack.js -w -p

server:
	python -m SimpleHTTPServer