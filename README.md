# echowo
Bash `echo` like with string uwufication.  
Based on [echowo](https://github.com/kokoscript/echowo) and written in Crystal.

## Build
Myake sure you have **Crystal** instawwed, then:

```
git clone https://github.com/joseafga/echowo.git
cd echowo
crystal build "src/echowo.cr" -o "bin/echowo" --release
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
~$ echowo -e "\a\e \x42 \0123 hello \U1f618 \\\\ \""
owo B S hewwo 😘 \ " huoooh...
```
