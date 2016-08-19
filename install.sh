#!/bin/sh

add_rc () {
    if [[ -e $1 ]]; then
        cat <<'EOF' >> $1
export PERLLIB="$HOME/pl:$PERLLIB"
alias pl="perl -ML"
EOF
    fi
}

add_rc $HOME/.bashrc
add_rc $HOME/.zshrc
