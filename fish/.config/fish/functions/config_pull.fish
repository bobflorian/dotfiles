function config_pull --description 'Pull latest Fish config'
    cd ~/dotfiles
    git pull
    cd -
end