//deploy.sh
set -e
npm run build
cd dist
git init
git add -A
git commit -m 'deploy'
git push -f https://ben7152000.github.io/todolist_vue_mongodb/ master:gh-pages
cd -
