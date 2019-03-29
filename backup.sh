cp ~/.vimrc vimrc
cp ~/.gvimrc gvimrc
cp ~/.config/karabiner/karabiner.json karabiner.json
cp ~/.zshrc zshrc
git add *
git ci -m 'backup'
git push --set-upstream origin master
