FROM alpine
LABEL maintainer="info@flatland.be"

RUN apk add --no-cache --virtual .build-deps g++ python3-dev \
    && apk add --update python3 \
    && apk add --no-cache neovim neovim-doc git curl nodejs npm ctags yarn bash the_silver_searcher \
    && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
    && ~/.fzf/install \
    && pip3 install --upgrade pip setuptools \
    && pip3 install --upgrade neovim \
    && npm install -g neovim \
    && cd /root \
    && git clone https://github.com/leny/pweneovim ~/.pweneovim \
    && mkdir -p ~/.config /src \
    && ln -sfv ~/.pweneovim ~/.config/nvim \
    && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && nvim +PlugInstall +CocInstall coc-neosnippet coc-json coc-tsserver coc-html coc-css coc-yaml coc-highlight coc-emmet +qall \
    && nvim "+call coc#util#build()" +qall \
    && cd /root/.config/nvim/plugged/coc.nvim \
    && npx modclean -r \
    && apk del .build-deps

ENV FZF_DEFAULT_COMMAND ag --hidden --ignore .git -g \"\"

VOLUME /src

CMD ["nvim", "+cd /src", "./src"]
