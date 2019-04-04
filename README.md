# docker-neovim

> ☣️ My neovim configuration, in a docker container

* * *

> ⚠️ **NOTE:** this is an heavy *work in progress*

* * *

## Build

    docker build -t neovim .

### Deploy

    docker login
    docker tag neovim leny/neovim:latest
    docker push leny/neovim:latest

## Use

With `bash`/`zsh`:

    docker run -it -v $(pwd):/src leny/neovim

With `fish`:

    docker run -it -v (pwd):/src leny/neovim
