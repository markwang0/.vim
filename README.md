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
