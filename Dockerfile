FROM alpine

RUN apk --update add \
  bash \
  bash-completion \
  curl \
  fzf \
  git \
  vim

RUN addgroup -S mg && adduser -S markgaze -G mg

COPY . /home/markgaze

USER markgaze
