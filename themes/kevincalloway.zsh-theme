local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Borrowed from: https://github.com/emilis/emilis-config/blob/master/.bash_ps1
# Prompt variable:
#OLD_PS1="$PS1"
#PS1="$status_style"'$fill \t\n'"$prompt_style$OLD_PS1$command_style"

# Reset color for command output
# (this one is invoked every time before a command is executed):
#trap 'echo -ne "\e[0m"' DEBUG #For Linux
#trap 'echo -ne "\033[00m"' DEBUG

PROMPT_DIVIDER='$fill'$'\n'                                                                                                                                                          
PROMPT="$PROMPT_DIVIDER""$PROMPT"

function set_divider_string() {
    # Fill with minuses
    # (this is recalculated every time the prompt is shown in function prompt_command):
    fill="--- "

    # create a $fill of all screen width minus the time string and a space:
    let fillsize=${COLUMNS}-9
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="-${fill}" # fill with underscores to work on 
        let fillsize=${fillsize}-1
    done
}

precmd_functions+=(set_divider_string)
set_divider_string
