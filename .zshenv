[ -d "$HOME/.cargo" ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/.rusty-tags" ] && export export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/
[ -d "$HOME/DCD" ] && export PATH="$HOME/DCD/bin:$PATH"
[ -d "$HOME/Nim" ] && export PATH=$PATH:$HOME/Nim/bin

if [ -d "$HOME/.anyenv" ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
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
