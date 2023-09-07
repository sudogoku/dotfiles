# How to set up entire environment

## Mac Install

1. Install Homebrew

   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

   Then run caveat command so that `brew` is in the `$PATH`. Once we symlink the `.zprofile`, this will happen automatically.

1. Install tools

   ```
   brew update && brew upgrade
   brew install \
      kitty \
      lf \
      coreutils \
      trash \
      tmux \
      neovim \
      koekeishiya/formulae/yabai \
      koekeishiya/formulae/skhd \
      ripgrep \
      stow \
      fzf \
      rust \
   ```

1. Install command-not-found functionality (like Ubuntu's apt-get)

   ```
   brew tap homebrew/command-not-found
   ```

1. Symlink Mac dotfiles

   ```
   stow -v -R -t $HOME mac-specific
   ```

1. Start Yabai & SKHD services

   ```
   # This may be necessary
   mkdir /Users/{USERNAME}/Library/LaunchAgents

   skhd --start-service
   yabai --start-service
   ```

1. Install Neovim dependencies

   ```
   pip3 install neovim
   ```

1. Install NERD fonts

   - Maintained here: https://github.com/ryanoasis/nerd-fonts
   - Alacritty.yml/Kitty.conf uses `FiraCode Nerd Font Mono`
   - Install corresponding `*.otf` file manually: https://github.com/ryanoasis/nerd-fonts/

1. Follow [platform agnostic](#platform-agnostic-install) steps

## Linux Install

1. Add custom repositories (Debian)

`add-apt-repository ppa:neovim-ppa/unstable`

1. Install tools

   a. (Debian-based)

   ```
   apt-get update && apt-get upgrade
   apt-get install \
      kitty \
      zsh \
      tmux \
      neovim \
      ripgrep \
      lm-sensors \
      stow \
      fzf

   curl https://sh.rustup.rs -sSf | sh
   ```

   b. (Arch-based)

   ```
   pacman -Syu \
      kitty \
      zsh \
      tmux \
      neovim \
      ripgrep \
      lm-sensors \
      free \
      stow \
      fzf \
      rust \
   ```

1. Symlink Linux specific dotfiles

   ```
   stow -v -R -t $HOME linux-specific
   ```

1. Install NERD fonts

   ```
   mkdir -p ~/.local/share/fonts
   wget -P "$HOME/.local/share/fonts" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
   ```

1. Install `lf`

   - Grab tarball here: https://github.com/gokcehan/lf/releases

   ```
   wget https://github.com/gokcehan/lf/releases/download/r6/lf-linux-amd64.tar.gz -O lf-linux-amd64.tar.gz
   tar -xvf lf-linux-amd64.tar.gz
   chmod +x lf
   sudo mv lf /usr/local/bin
   rm lf-linux-amd64.tar.gz
   ```

1. Follow [platform agnostic](#platform-agnostic-install) steps

## Platform Agnostic Install

1. Install git, if that's not included in the distro

1. Setup git config

   ```
   git config --global user.name "Paul DiLoreto"
   git config --global user.email "paul.diloreto@gmail.com"
   ```

1. Symlink platform-agnostic dotfiles

   ```
   mkdir ~/.config
   stow -v -R -t $HOME multi-platform
   ```

1. Setup `~/.zshrc` to be:

```
source $HOME/.config/zsh/.zshrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

1. Add environment variables to `~/.zshenv` (i.e. OPENAI_API_KEY)

1. Set zsh as default shell

   ```
   chsh -s $(which zsh)
   ```

1. Install starship

   ```
   sh -c "$(curl -fsSL https://starship.rs/install.sh)"
   ```

1. Install Z script

   ```
   git clone https://github.com/rupa/z.git ~/.config/z
   ```

1. Install nvm

   ```
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
   nvm install --lts
   ```

1. Install tmux plugin manager

   ```
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   ```

1. Install dependencies for [tmux-temp plugin](https://github.com/kolach/tmux-temp) for status bar CPU temperature.

   1. Mac dependency
      It uses [lavoiesl/osx-cpu-temp](https://github.com/lavoiesl/osx-cpu-temp)
      ```
      git clone https://github.com/lavoiesl/osx-cpu-temp /tmp/osx-cpu-temp
      (cd /tmp/osx-cpu-temp && make && sudo make install)
      rm -rf /tmp/osx-cpu-temp
      ```
   1. Linux dependency

      ```
      sudo apt-get install lm-sensors

      # After installation type the following in terminal
      sudo sensors-detect

      # You may also need to run
      sudo service kmod start
      ```

1. Open Neovim and run `:PackerInstall`

1. Open Tmux and install tmux plugins (\<prefix\> + I)
