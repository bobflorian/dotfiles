function config_sync --description 'Sync Fish config with git repo'
    cd ~/dotfiles
    cp -r ~/.config/fish/* fish/.config/fish/
    git add .
    git commit -m "Update Fish config: $(date +%Y-%m-%d)"
    git push
    cd -
end