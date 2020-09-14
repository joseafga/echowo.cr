# echowo
Crystal powt of [echowo](https://github.com/kokoscript/echowo).
> Near-drop-in replacement for the Unix echo command which also uwu-fies text

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
echowo [OPTIONS] [STRING]
```

The available options are:

```
-v, --version            Show version
-h, --help               Show help
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
