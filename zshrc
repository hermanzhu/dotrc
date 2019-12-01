source antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip

antigen bundle autojump
antigen bundle brew
antigen bundle brew-cask
antigen bundle osx
antigen bundle adb
antigen bundle kubectl

antigen bundle thefuck

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

# prompt theme
SPACESHIP_USER_SHOW=always
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT="%D{%Y-%m-%d} %*"
SPACESHIP_DIR_TRUNC_REPO=true
SPACESHIP_DIR_PREFIX="["
SPACESHIP_DIR_SUFFIX="] "


# PATH
# CUDA
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib:$CUDA_HOME/extras/CUPTI/lib"
export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
export PATH=$DYLD_LIBRARY_PATH:$PATH
export flags="--config=cuda --config=opt"
export PATH="/Developer/NVIDIA/CUDA-10.1/bin:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

# opencv
export PATH="/usr/local/opt/opencv@3/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/opencv@3/lib"
export CPPFLAGS="-I/usr/local/opt/opencv@3/include"
export PKG_CONFIG_PATH="/usr/local/opt/opencv@3/lib/pkgconfig"

# libxml2
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/libxml2/lib/pkgconfig"
