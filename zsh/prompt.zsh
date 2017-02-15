autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git #  hg svn
zstyle ':vcs_info:git*' use-simple true
zstyle ':vcs_info:git*' max-exports 2
zstyle ':vcs_info:git*' formats ' %b' 'x%R'
zstyle ':vcs_info:git*' actionformats ' %b|%a' 'x%R'

autoload colors && colors

git_dirty()
{
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    command git diff --quiet --ignore-submodules HEAD &>/dev/null;
    if [[ $? -eq 1 ]]; then
        print -n "%{%F{red}%} ✗ %{%f%}"
    else
        print -n "%{%F{green}%} ✔ %{%f%}"
    fi
}

git_arrows()
{
    command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

    local arrows=""
    local status
    arrow_status="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"

    (( !$? )) || return

    arrow_status=(${(ps:\t:)arrow_status})
    local left=${arrow_status[1]} right=${arrow_status[2]}

    (( ${right:-0} > 0 )) && arrows+="%{%F{011}⇣%2G%f%}"
    (( ${left:-0} > 0 )) && arrows+="%{%F{012}⇡%2G%f%}"

    print -n $arrows
}

suspended_jobs()
{
    local sj
    sj=$(jobs 2>/dev/null | tail -n 1)
    if [[ $sj != "" ]]; then
        print -n "%{$FG[208]%} ✱ %{%f%}"
    fi
}

connection_type()
{
    local session_type
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] ; then
        session_type=ssh
    else
        case $(ps -o comm= -p $PPID) in
            sshd|*/sshd) session_type=ssh;;
        esac
    fi

    case $session_type in
        ssh)
            if [ -n "$SSH_TTY" ] ; then
                local from

                if [ -n "$SSH_CLIENT" ] ; then
                    read -r rhost rport lport <<<"$SSH_CLIENT"
                elif [ -n "$SSH_CONNECTION" ] ; then
                    read -r rhost rport lhost lport <<<"$SSH_CONNECTION"
                fi

                if [ ! -z "$rhost" ] ; then
                    from=" from ${rhost//\%/%%}"
                fi

                print -n "%{%F{242}%}via%{%f%} %{%F{166}%}$session_type%{%F{242}%}%{%f%}$from "
            fi
            ;;
    esac
}

precmd()
{
    vcs_info
    echo -ne "\033]0;${USER}@${HOST%%.*}: ${PWD/#$HOME/~}\007"
}

export PROMPT='%{%F{green}%}%n%{%f%}@%{%F{magenta}%}%m%{%f%} %{%F{242}%}in%{%f%} %{%F{011}%}%~%{%f%}
`connection_type`%{%(?.%F{012}.%F{red})%}%{⇨ %2G%}%{%f%} '
export RPROMPT='`git_dirty`%{%F{241}%}$vcs_info_msg_0_%{%f%} `git_arrows``suspended_jobs`'
