# use gpg-agent
set -e SSH_AGENT_PID
if test (set -q gnupg_SSH_AUTH_SOCK_by; and echo $gnupg_SSH_AUTH_SOCK_by; or echo 0) -ne %self
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end
set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# use zoxide 
zoxide init --cmd cd fish | source
