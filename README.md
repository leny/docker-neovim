# docker-neovim

> ☣️ My neovim configuration, in a docker container

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

* * *

> ☝️ **NOTE:** this is complete and working. The used config is stored [in a separate repository](https://github.com/leny/pweneovim). The image is kinda heavy (±400Mb), and due to the nature of neovim and the plugins, I'm not sure I can do better at the moment.
