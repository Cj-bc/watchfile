# watchfile watches files in real time

Watchfile display given file. If there's any changes, rewrite it.

# usage

```bash
$ watchfile file.txt
# screen will be cleard, and cat that file from (1,1)
# and when you edit and save the file, watchfile will rewrite it.
```

# install

## homebrew (in progress...)

```bash
$ brew tap Cj-bc/watchfile
$ brew install watchfile
```

## bpkg (in progress...)

```bash
$ bpkg install Cj-bc/watchfile -g
```


## from source code

```bash
$ git clone https://github.com/Cj-bc/watchfile.git
$ cd watchfile
$ mv watchfile.sh /usr/local/bin/watchfile
```
