# dotfiles

## Docker

build:

```
$ docker build -t piyopiyo2/dev .
```

run:

```
$ docker run --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -it -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK -v ~/dataset:/dataset -v ~/works:/works -v ~/dataset:/dataset piyopiyo2/dev /bin/bash
```
