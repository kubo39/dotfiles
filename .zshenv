#zmodload zsh/zprof && zprof

[ -d "$HOME/.cargo" ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/DCD" ] && export PATH="$HOME/DCD/bin:$PATH"
[ -d "$HOME/DScanner" ] && export PATH="$HOME/DScanner/bin:$PATH"
[ -d "$HOME/.nimble" ] && export PATH=$PATH:$HOME/.nimble/bin
[ -d "$HOME/ponyc" ] && export PATH=$PATH:$HOME/ponyc/build/release
[ -d "$HOME/.local/bin" ] && export PATH=$HOME/.local/bin:$PATH

if [ -d "$HOME/go" ]; then
    export PATH=/usr/local/go/bin:$PATH
    export GOPATH="$HOME/gopath"
    export PATH=$GOPATH/bin:$PATH
fi

if [ -d "$HOME/.anyenv" ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init - --no-rehash)"
fi

case ${OSTYPE} in
    openbsd*)
        export PKG_PATH=http://ftp.jaist.ac.jp/pub/OpenBSD/$(uname -r)/packages/$(uname -p)/
        export CVSROOT="anoncvs@anoncvs.jp.openbsd.org:/cvs"
        ;;
esac

if [ -r ~/.zshenv.local ]; then
  . ~/.zshenv.local
fi
