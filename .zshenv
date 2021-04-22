#zmodload zsh/zprof && zprof

[ -d "$HOME/.cargo" ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/.nimble" ] && export PATH=$PATH:$HOME/.nimble/bin
[ -d "$HOME/ponyc" ] && export PATH=$PATH:$HOME/ponyc/build/release
[ -d "$HOME/.local/bin" ] && export PATH=$HOME/.local/bin:$PATH
[ -d "$HOME/wasi-sdk-12.0/" ] && export PATH=$PATH:$HOME/wasi-sdk-12.0/bin
[ -d "$HOME/cmake" ] && export PATH=$HOME/cmake/bin:$PATH

if [ -d "$HOME/go" ]; then
    export PATH=$HOME/.local/go/bin:$HOME/go/bin:$PATH
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
