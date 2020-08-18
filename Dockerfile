FROM alpine

RUN apk --update add \
  bash \
  bash-completion \
  curl \
  fzf \
  git \
  vim

RUN addgroup -S mg && adduser -S markgaze -G mg

USER markgaze

COPY . /home/markgaze

# Create a directory to test git
RUN mkdir /home/markgaze/git \
  && mkdir /home/markgaze/git/markgaze && \
  mkdir /home/markgaze/git/markgaze/test && \
  cd /home/markgaze/git/markgaze/test && \
  git init
