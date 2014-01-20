8i-docsviewer
=============


- install node, www.nodejs.org
- `sudo npm install -g coffee-script webpack`
- `git clone git@github.com:jtangelder/8i-docsviewer.git`
- `cd 8i-docsviewer`
- `npm install`
- `make server` to run a simple devserver with Python on http://localhost:8000

Open a new tab in your terminal, and run one of these commands.
- `make watch` to compile a development version and watch for changes.
- `make watch-p` same as above, but generates a minified production package.
