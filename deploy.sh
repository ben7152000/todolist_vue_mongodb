//deploy.sh
set -e
npm run build
cd dist
git init
git add -A
git commit -m 'deploy'
git push -f https://github.com/ben7152000/todolist_vue_mongodb.git master:gh-pages
cd -
