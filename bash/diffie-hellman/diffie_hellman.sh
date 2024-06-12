#!/usr/bin/env bash

private_key() {
    echo $(( RANDOM % ($1 - 2) + 2 ))
}

exchange() {
    local p="$1" g="$2" a="$3" i res=1
	for ((i=0; i<a;i++)); do
		res=$(( (res * g) % p))
	done
    echo "$res"
}

main() {
    action=$1; shift
    case "$action" in
        publicKey|secret)
            exchange "$@";;
        privateKey) 
            private_key "$@";;
        *)
    esac
}

main "$@"
