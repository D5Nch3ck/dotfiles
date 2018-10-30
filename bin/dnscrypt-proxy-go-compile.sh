#!/bin/sh
mkdir -p ${HOME}/code/gopath
cd "$HOME/code"
#rm -rf dnscrypt-proxy
test -d dnscrypt-proxy && (cd dnscrypt-proxy && git pull) || git clone https://github.com/jedisct1/dnscrypt-proxy
export GOPATH="${HOME}/code/gopath"
mkdir -p "${GOPATH}/src/github.com/jedisctl"
ln -sfn "${HOME}/code/dnscrypt-proxy" \
"${GOPATH}/src/github.com/jedisctl/dnscrypt-proxy"
cd "$GOPATH/src/github.com/jedisctl/dnscrypt-proxy/dnscrypt-proxy"

echo "Compiling..."
go build -ldflags="-s -w"
echo "Testing..."
./dnscrypt-proxy -resolve google.com
