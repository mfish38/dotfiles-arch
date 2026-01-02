#!/usr/bin/env fish

function pac
    sudo pacman -S --needed --noconfirm $argv
end

function aur
    paru -S --needed --noconfirm $argv
end

function dotstow
    pushd ~/dotfiles; or exit
    stow --adopt $argv
    popd; or exit
end

# Dotfile Setup
pac stow
aur stew

# Niri
pac xdg-desktop-portal-gnome

# Ghostty
dotstow ghostty

# Git
pac libsecret
dotstow git

# Fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; and fisher install jorgebucaran/fisher

# Fonts
pac ttf-gohu-nerd

# Neovim
pac neovim wl-clipboard make unzip gcc ripgrep fd

# Firefox
set FIREFOX_PROFILE (find ~/.mozilla/firefox -maxdepth 1 -type d -name "*.default-release" | head -n 1)
stow --adopt --target=$FIREFOX_PROFILE firefox

sudo mkdir -p /etc/firefox/policies
sudo stow --adopt --target=/etc/firefox etc_firefox

# Dolphin
pac dolphin
xdg-mime default org.kde.dolphin.desktop inode/directory

# Discord
pac discord

# Node (via nvm fish plugin)
fisher install jorgebucaran/nvm.fish
nvm install 24

# Bun (installer is bash)
curl -fsSL https://bun.com/install | bash -s "bun-v1.2.15"

# VSCode
aur visual-studio-code-bin
pac gnome-keyring

# VSCode extensions list
set extensions \
    vscodevim.vim \
    plievone.vscode-template-literal-editor \
    ms-azuretools.vscode-docker \
    talhabalaj.actual-font-changer \
    vue.volar \
    nuxtr.nuxt-vscode-extentions \
    streetsidesoftware.code-spell-checker \
    mechatroner.rainbow-csv \
    oderwat.indent-rainbow \
    esbenp.prettier-vscode \
    ionutvmi.path-autocomplete \
    ms-vsliveshare.vsliveshare \
    bradlc.vscode-tailwindcss \
    gruntfuggly.todo-tree \
    dbaeumer.vscode-eslint \
    bierner.github-markdown-preview \
    saeris.markdown-github-alerts \
    catppuccin.catppuccin-vsc-pack \
    murloccra4ler.leap \
    yoavbls.pretty-ts-errors \
    ms-vscode.vscode-speech \
    lucafalasco.matcha \
    lucafalasco.matchalk \
    github.vscode-github-actions \
    ryu1kn.partial-diff \
    bocovo.dbml-erd-visualizer

for extension in $extensions
    code --install-extension $extension
end

dotstow vscode
