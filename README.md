# echowo
Based on [echowo](https://github.com/kokoscript/echowo).
Bash `echo` like with string uwufication.

## Build
Myake sure you have **Crystal** instawwed, then:

```
git clone https://github.com/joseafga/echowo.git
cd echowo
crystal build echowo.cr -o ./bin/echowo --release
```

Executable file wiww be located in `bin/echowo`

## Usage
```
echowo [OPTIONS] [ARG ...]
```

The available options are:

```
-v, --version            show version
-n                       do not append a newline
-e                       enable interpretation of backslash escapes
-E                       disable interpretation of backslash escapes
-h, --help               show help
-n                       Do not append a newline
```

## Examples
```bash
~$ echowo hello world
^w^ hewwo wowld huoooh...
~$ echowo this is reallys useless
owo this is reawwys useless nyu...
~$ echowo -n without newline option
nya! without newline option ^w^~$ echowo "really cool"
rawr! reawwy cool huoooh...
~$ 
```
