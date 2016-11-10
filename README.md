# Arch Linux devel dockerfile

This dockerfile is for checking your handmaid PKGBUILD script.
This is based on base/devel image.

## How to build

```
$ docker build -t tnishinaga/archdevel .
```

* Please change "tnishinaga/archdevel" to whatever you want.

## How to run

```
$ docker run --rm -it --name hogehoge tnishinaga/archdevel /bin/bash
```

* Please change "hogehoge" to whatever you want.


## Infomation

| | |
|:-:|:-:|
| User | developer |
| Pass | developer |
| home | /home/developer |

