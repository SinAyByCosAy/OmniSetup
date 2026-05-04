SCRIPT_DIR="${0:A:h}"
source "$SCRIPT_DIR/validations.sh"

brew-add() {
    local tool="$1"
    shift

    validate_flags "$@" || return 1

    brew install "$tool" || return 1
    add-tool "$tool" "$@"
}
cask-add() {
    local tool="$1"
    shift

    validate_flags "$@" || return 1

    brew install --cask "$tool" || return 1
    add-tool "$tool" --gui "$@"
}
apt-add() {
    local tool="$1"
    shift

    validate_flags "$@" || return 1

    sudo apt install -y "$tool" || return 1
    add-tool "$tool" "$@"
}
npm-add() {
    echo "$SCRIPT_DIR/validations.sh"
    local tool="$1"
    shift

    validate_flags "$@" || return 1

    npm install -g "$tool" || return 1
    add-tool "$tool" --npm
}