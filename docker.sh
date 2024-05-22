
build() {
    docker build . -t androidci --no-cache
}

run() {
    docker run -it androidci bash
}

if [ "$1" = "build" ]; then
    build
elif [ "$1" = "run" ]; then
    run
elif [ "$1" = "exec" ]; then
    exec
fi

exit 0