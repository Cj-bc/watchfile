# watchfile watches files in real time

Watchfile display given file. If there's any changes, rewrite it.

# usage

```bash
$ watchfile file.txt
# screen will be cleard, and cat that file from (1,1)
# and when you edit and save the file, watchfile will rewrite it.
```

# install

## homebrew

```bash
$ brew tap Cj-bc/watchfile
$ brew install watchfile
```

when you use hoembrew, it might not work and say 'Permission denied.'
This is known big bug and this is caused because watchfile itself($(brew --prefix)/Cellar/watchfile/<version>/bin/watchfile) has no permission to execute.
I'm not sure why it's occured, but the easy solution is to run:
`$ chmod 755 $(brew --prefix)/Cellar/watchfile/<version>/bin/watchfile`

## bpkg

```bash
$ bpkg install Cj-bc/watchfile -g
```


## from source code

```bash
$ git clone https://github.com/Cj-bc/watchfile.git
$ cd watchfile
$ mv watchfile.sh /usr/local/bin/watchfile
```
