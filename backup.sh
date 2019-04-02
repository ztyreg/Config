cp ~/.vimrc vimrc
cp ~/.config/nvim/init.vim nvimrc
cp ~/.gvimrc gvimrc
cp ~/.config/karabiner/karabiner.json karabiner.json
cp ~/.zshrc zshrc
cp -r ~/.vim/plugged/vim-snippets/UltiSnips/ UltiSnips
git add *
git ci -m 'backup'
git push --set-upstream origin master
