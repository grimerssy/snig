#!/bin/sh

GO_DIR="$GOPATH/.go"
SOURCE_FILE="$GO_DIR/.source"

OS=$(uname -s | tr "[:upper:]" "[:lower:]")
ARCH=$(uname -m)

COMMAND=$1
VERSION=$2

DIRECTORY="$GO_DIR/$VERSION"

if ! [[ "(darwin, linux)[*]" =~ "$OS" ]];
then
  echo "quit using windows"
  return 1
fi

show_help() {
  echo "\ncommands:\n"
  echo "\thelp"
  echo "\tinstall [version]"
  echo "\tset [version]"
  echo "\nversions:\n"
  echo "\tvisit https://go.dev/dl to see all available versions of go\n"
}

check_version() {
  if ! [[ $VERSION =~ ^1\.[1-9]?[0-9]\.[1-9]?[0-9]$ ]];
  then
    echo "invalid version input"
    return 1
  fi
}

write_source() {
  echo "eval export PATH=$DIRECTORY/bin:'$'PATH" &> $SOURCE_FILE
}

set_version() {
  check_version
  if ! [ -d $DIRECTORY ]
  then
    echo "version $VERSION is not installed"
    return 1
  fi
  write_source
  . $SOURCE_FILE
  echo "now using go $VERSION"
}

install_version() {
  check_version
  if [ -d $DIRECTORY ]
  then
    echo "version $VERSION is already installed"
  else
    ARCHIVE="go$VERSION.$OS-$ARCH.tar.gz"

    echo "downloading $ARCHIVE"

    curl -LO https://go.dev/dl/$ARCHIVE &>/dev/null

    echo "unarchiving $ARCHIVE"

    tar -C . -xzf $ARCHIVE &>/dev/null
    rm $ARCHIVE &>/dev/null

    if ! [ $? -eq 0 ]; then
        echo "could not unarchive downloaded file"
        echo "make sure specified version is available at https://go.dev/dl"
        return 1
    fi

    echo "installing go $VERSION"

    mkdir -p $GO_DIR
    mv go $DIRECTORY &>/dev/null

    echo "installation is successful"
  fi

  echo "run \`go-version-manager.sh set $VERSION\` to make it active"
}

case $COMMAND in
  help)
    show_help
    ;;
  init)
    . $SOURCE_FILE
    ;;
  install)
    install_version
    ;;
  set)
    set_version
    ;;
  *)
    echo "invalid command"
    echo "type \`go-version-manager help\` to see more"
    return 1
    ;;
esac

unset GO_DIR
unset SOURCE_FILE

unset OS
unset ARCH

unset COMMAND
unset VERSION

unset DIRECTORY
