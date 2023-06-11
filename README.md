# npm-local

It's possible to [specify a local dependency in package.json](https://stackoverflow.com/a/26028854/639133) (as of npm 2.0.0)

Clone this repo
```bash
export PRO_PATH="/absolute/path/to/your/projects/dir"
git clone https://github.com/mozey/npm-local.git "$PRO_PATH/npm-local"
```

Then follow instructions for [mozey/npm-import](https://github.com/mozey/npm-import/blob/main/README.md#npm-import)


## Build

Create a new build
- Static analysis of TypeScript source
- Create type definitions
- Bundle app Javascript and CSS with esbuild
```bash
./scripts/app.sh
ls -lah dist
```
