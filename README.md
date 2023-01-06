# Requirements
1. *nix operating system
2. `vim >= v8.0` to install plugins
3. `vim >= v9.0` for some settings
4. [`fzf`](https://github.com/junegunn/fzf)
5. [`ripgrep`](https://github.com/BurntSushi/ripgrep)
---

# Installation (overwrites `~/.vim`)

```sh
$ cd $HOME
$ git clone --recursive https://github.com/markwang0/.vim.git
```
---

# Plugin management[^1]

### Add plugins
```sh
$ cd ~/.vim/pack/plugins/start
$ git submodule add [git url]
```


### Update all plugins
```sh
$ cd ~/.vim
$ git submodule foreach git pull origin master
```

### Generate help docs
```sh
$ vim
:helptags ALL
```

### Remove plugins
```sh
$ cd ~/.vim/pack/plugins/start
$ git submodule deinit [plugin]
$ git rm -r [plugin]
$ rm -r ~/.vim/.git/modules/pack/plugins/start/[plugin]
```

[^1]: *[Using git-submodules to version-control Vim plugins](
https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560)*.
