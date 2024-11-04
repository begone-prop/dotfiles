#!/bin/sh

file=$(readlink -f "$1")
dir=${file%/*}
base="${file%.*}"
ext="${file##*.}"

handle_c() {
    makef="${dir}/Makefile"

    cc='gcc'
    test "$ext" = 'cpp' && cc='g++'

    test ! -f "$makef" && {
        "$cc" -Wall -Wextra -g "$file" -o "$base" && "$base"
        exit $?
    }

    target=$(grep '^all:' "$makef" | cut -d ':' -f 2 | sed -E '/^$/d; s/\s+//g;')

    [ -z "$target" ] && {
        echo 'Empty or no all target found'
        echo 'Exiting...'
        exit 1
    }

    final=$target
    echo "$target" | grep -q '\$' && {
        final=$(echo "$target" | sed -E 's/\s*\$\((.*)\)/^\1/g; /^$/d' |
        grep -f - "$makef" | cut -d '=' -f 2)
    }

    cd "$dir"
    make && "${dir}/${final}"
    cd - >/dev/null

}

handle_rust() {
    if [ -f "${dir}/Cargo.toml" ]; then
        cargo -C "$dir" run
    else
        rustc "${file}" && "${base}"
    fi
}

case $ext in
    c) handle_c;;
    cpp) handle_c;;
    py) python "$file";;
    go) go run "$file" ;;
    js) node "$file";;
    java) javac -d classes "$file" && java -cp classes "${1%.*}" ;;
    rs) handle_rust;;
    tex) pdflatex --output-directory="$dir" "$base" \
        >/dev/null && echo "Complied $file";;
    *) sed -n '/^#!/s/^#!//p; q' "$file" | xargs -r -I % "$file" ;;
esac
