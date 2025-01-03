function config_pull --description 'Pull latest Fish config'
    cd ~/dotfiles
    git pull
    
    # Clear Mac-specific Z plugin paths
    set --erase Z_DATA
    set --erase Z_DATA_DIR 
    set --erase Z_EXCLUDE

    # Create directories
    mkdir -p ~/.config/fish/{functions,conf.d,completions}
    mkdir -p ~/.local/share/z

    # Check and install Fisher (plugin manager)
    if not functions -q fisher
        echo "Installing Fisher plugin manager..."
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    end

    # Common plugins to check/install
    set plugins \
        "jorgebucaran/fisher" \
        "jethrokuan/z" \
        "PatrickF1/fzf.fish" \
        "edc/bass"

    for plugin in $plugins
        if not fisher list | grep -q $plugin
            echo "Installing $plugin..."
            fisher install $plugin
        end
    end

    # Copy config files
    cp -r fish/.config/fish/functions/* ~/.config/fish/functions/
    cp -r fish/.config/fish/conf.d/* ~/.config/fish/conf.d/
    cp fish/.config/fish/config.fish ~/.config/fish/
    
    if test -f fish/.config/fish/env.fish
        cp fish/.config/fish/env.fish ~/.config/fish/
    end
    
    cd -
end