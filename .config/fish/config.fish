# Aliases
alias vi=nvim
alias pn=pnpm
alias lg=lazygit
alias cl=claude
alias oc=opencode
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias fo='pomodoro focus'
alias br='pomodoro break'

# Pomodoro
set -g pomo_focus 30
set -g pomo_break 5

function pomodoro
    set -l type $argv[1]
    if test "$type" = focus
        set -l mins $pomo_focus
    else if test "$type" = break
        set -l mins $pomo_break
    else
        echo "Usage: pomodoro focus|break"
        return 1
    end
    echo $type | lolcat
    timer {$mins}m
    spd-say "'$type' session done"
end

# PATH and env vars are set in conf.d/paths.fish
