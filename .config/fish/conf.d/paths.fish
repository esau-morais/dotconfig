# Environment variables (set early so PATH expansions below work)
set -gx BUN_INSTALL $HOME/.bun
set -gx DENO_INSTALL $HOME/.deno
set -gx PNPM_HOME $HOME/.local/share/pnpm
set -gx FLYCTL_INSTALL $HOME/.fly
set -gx NVM_DIR $HOME/.nvm
set -gx DISABLE_AUTO_UPDATE true

# PATH — fish_add_path persists to universal vars, safe to call repeatedly (idempotent)
fish_add_path --path \
    $HOME/.config/lsp/lua-language-server/bin \
    $HOME/.local/share/pnpm \
    $HOME/.bun/bin \
    $HOME/.deno/bin \
    $HOME/.local/bin \
    $HOME/.fly/bin \
    $HOME/.opencode/bin \
    $HOME/.npm-global/bin \
    $HOME/.grind/bin \
    $HOME/zig \
    $HOME/.cargo/bin \
    /usr/local/go/bin

if test -n "$ANDROID_HOME"
    fish_add_path --path $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools
end

if test -n "$JAVA_HOME"
    fish_add_path --path $JAVA_HOME/bin
end

if test -n "$DPRINT_INSTALL"
    fish_add_path --path $DPRINT_INSTALL/bin
end

# Homebrew
if test -d /home/linuxbrew/.linuxbrew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# Cargo
set -gx PATH $HOME/.cargo/bin $PATH
