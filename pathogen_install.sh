#!bash

# backup existing conf and link package to their intended locations 
mv ~/.vimrc ~/.vimrc_old
cp .vimrc ~/.vimrc

# Make package directories
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle

# Install pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Packages to install
git clone https://github.com/chriskempson/base16-vim.git ~/.vim/bundle/base-16-vim
git clone https://github.com/cocopon/iceberg.vim.git ~/.vim/bundle/iceberg.vim
git clone https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
git clone https://github.com/itchyny/lightline.vim.git ~/.vim/bundle/lightline.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/vim-gitgutter
git clone https://github.com/tpope/vim-surround.git ~/.vim/vim-surround

