#!/usr/bin/env zsh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Env Vars
export POETRY_CONFIG_DIR="$HOME/.config/pypoetry"

# Path
typeset -U path PATH

path=(
    "$HOME/.local/bin"
    "$HOME/.local/share/bob/nvim-bin"
    $path
)

# Platform specific things
UNAME="$(uname -sr)"

## Mac specific
case "$UNAME" in Darwin*)
    export JAVA_HOME="$(brew --prefix openjdk@21)/libexec/openjdk.jdk/Contents/Home"
	export STM32CubeMX_PATH="/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources"

    path=(
        "/opt/homebrew/bin"
        "$JAVA_HOME/bin"
        "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
        $path
    )
    ;;
esac

## Windows (WSL or Git Bash) specific
case "$UNAME" in Linux*-WSL2|MINGW64*)
    path=(
        "$HOME/AppData/Local/bob/nightly/bin"
        $path
    )
	;;
esac

# Work zprofile
if [[ -f "$HOME/.zprofile-work" ]]; then
  source "$HOME/.zprofile-work"
fi

export PATH