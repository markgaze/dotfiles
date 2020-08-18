FROM alpine

RUN apk --update add \
  bash \
  bash-completion \
  curl \
  fzf \
  git \
  vim

COPY . /root
