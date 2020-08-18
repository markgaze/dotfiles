FROM alpine

RUN apk --update add \
  bash \
  bash-completion \
  curl \
  fzf \
  git \
  tmux \
  vim

RUN adduser -G root --shell /bin/bash -S markgaze 

USER markgaze

COPY . /home/markgaze

# Create a directory to test git
RUN mkdir /home/markgaze/git \
  && mkdir /home/markgaze/git/markgaze && \
  mkdir /home/markgaze/git/markgaze/test && \
  cd /home/markgaze/git/markgaze/test && \
  git init
