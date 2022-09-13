#!/bin/sh

GO_DIRECTORY="$GOPATH/.go"
CURRENT_VERSION_FILE="$GO_DIRECTORY/.current"

OS=$(uname -s | tr "[:upper:]" "[:lower:]")
ARCH=$(uname -m)

if ! [[ "(darwin, linux)[*]" =~ "$OS" ]]; then
  echo "quit using windows"
  return 1
fi

COMMAND=$1
VERSION=$2

VERSION_DIRECTORY="$GO_DIRECTORY/$VERSION"

VERSION_REGEX="1\.[1-9]?[0-9]\.[1-9]?[0-9]"

check_version() {
  if ! [[ $VERSION =~ "^$VERSION_REGEX$" ]]; then
    echo "invalid version input"
    return 1
  fi
}

read_current_version() {
  head -n 1 $CURRENT_VERSION_FILE
}

write_current_version() {
  echo $VERSION &> $CURRENT_VERSION_FILE
}

apply_current_version() {
  local version=$(read_current_version)
  local go_directory=$(echo $GO_DIRECTORY | sed -e 's/\//\\\//g')
  if ! [[ $PATH =~ "$GO_DIRECTORY/$VERSION_REGEX/bin" ]]; then
    export PATH="$GO_DIRECTORY/$version/bin:$PATH"
    return 0
  fi
  local pattern="$go_directory\/$VERSION_REGEX\/bin"
  local replace="$go_directory\/$version\/bin"
  export PATH=$(echo $PATH | sed -re "s/$pattern/$replace/")
}

list_installed_versions() {
  local current=$(read_current_version)
  local result=""
  for item in $GO_DIRECTORY/*; do
    if [ -d $item ]; then
      if ! [ -z $result ]; then
        result="\n$result"
      fi
      item=$(basename $item)
      if [ $item = $current ]; then
        item="$item (current)"
      fi
      result="$item$result"
    fi
  done
  echo $result
}

set_version() {
  check_version
  if ! [ $? -eq 0 ]; then
    return $?
  fi
  if ! [ -d $VERSION_DIRECTORY ]; then
    echo "version $VERSION is not installed"
    return 1
  fi
  write_current_version
  apply_current_version
  echo "now using go $VERSION"
}

install_version() {
  check_version
  if ! [ $? -eq 0 ]; then
    return $?
  fi
  if [ -d $VERSION_DIRECTORY ]; then
    echo "version $VERSION is already installed"
  else
    ARCHIVE="go$VERSION.$OS-$ARCH.tar.gz"

    echo "downloading $ARCHIVE"

    curl -fLO https://go.dev/dl/$ARCHIVE &>/dev/null
    if ! [ $? -eq 0 ]; then
      echo "could not download $ARCHIVE"
      echo "make sure specified version is available at https://go.dev/dl"
      return 1
    fi

    echo "unarchiving $ARCHIVE"

    tar -C . -xzf $ARCHIVE &>/dev/null
    local TAR_RESULT=$?

    rm $ARCHIVE &>/dev/null

    if ! [ $TAR_RESULT -eq 0 ]; then
        echo "could not unarchive downloaded file"
        return 1
    fi

    echo "installing go$VERSION"

    mkdir -p $GO_DIRECTORY
    mv go $VERSION_DIRECTORY &>/dev/null

    echo "installation is successful"
  fi

  echo "run with \`set $VERSION\` command to make it active"
}

show_help() {
  echo "\ncommands:\n"
  echo "\tinit"
  echo "\tlist"
  echo "\tset [version]"
  echo "\tinstall [version]"
  echo "\nversions:\n"
  echo "\tvisit https://go.dev/dl to see all available versions of go\n"
}

case $COMMAND in
  init)
    apply_current_version
    ;;
  list)
    list_installed_versions
    ;;
  set)
    set_version
    ;;
  install)
    install_version
    ;;
  *)
    show_help
    ;;
esac

unset GO_DIRECTORY
unset CURRENT_VERSION_FILE

unset OS
unset ARCH

unset COMMAND
unset VERSION

unset VERSION_DIRECTORY

unset VERSION_REGEX
