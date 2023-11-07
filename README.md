### Introduction
The neovim config uploaded is a linux variant thanks to WSL. This is a personalized fork of the NVChad distrobution mainly used for Go and C++ (as of writing this markdown)\
The installation steps below are for Windows since it is a bit more convaluded than expected.

### Installation 
Ensure the below programs are installed:\
- [GIT](https://git-scm.com/download/win)\
- [CMake Download Page](https://cmake.org/download/)\
- [C++ Build Tools Download Page](https://visualstudio.microsoft.com/downloads/?q=build+tools#build-tools-for-visual-studio-2022)\
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation) and [fd](https://github.com/sharkdp/fd#on-windows)

in %USERPROFILE%\AppData\Local\nvim\lua\plugins\
open init.lua and change <sup>(line 232 *as of writing*)</sup>
 ```
 dependencies = { "nvim-treesitter/nvim-treesitter", 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
 ```
to
 ```
 dependencies = { "nvim-treesitter/nvim-treesitter", 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```

### Error Handle

The main error that had me wracking my brain for hours was on regarding Telescope\
"'fzf' extension doesn't exist or isn't installed"\
Screenshot:\
![](https://i.imgur.com/0eqNFLS.png)
#### This error is resolved by heading to
%USERPROFILE%\AppData\Local\nvim-data\lazy\telescope-fzf-native.nvim\
#### and running the 'make' command in Git Bash terminal
screenshot:
![](https://i.imgur.com/4R2QVZG.png)
