FROM alpine

RUN apk --update add \
  bash \
  bash-completion \
  curl \
  git \
  less \
  ncurses \
  perl \
  tmux \
  vim

RUN adduser -G root --shell /bin/bash -S markgaze 

USER markgaze

RUN git clone --depth 1 https://github.com/junegunn/fzf.git /home/markgaze/.fzf && \
  ~/.fzf/install && \
  /home/markgaze/.fzf/install --all

# Create a directory to test git
RUN mkdir /home/markgaze/git \
  && mkdir /home/markgaze/git/markgaze && \
  mkdir /home/markgaze/git/markgaze/test && \
  cd /home/markgaze/git/markgaze/test && \
  git init

COPY . /home/markgaze/git/markgaze/dotfiles

RUN cd /home/markgaze/git/markgaze/dotfiles && ./install.sh
