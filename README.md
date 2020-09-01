# Urn Template
This is a template to use [urn](https://urn-lang.com) for scripting.

To package up the final lua code, I used a script provided by a forum member by the name of hdparm.
I committed the script here until it is publicly available.

Currently this template was only tested with the WSL (Windows Subsystem for Linux), but it should work just fine on linux/debian/ubuntu.
With msys or cygwin it should also be possible to use it directly under windows.

# Dependencies
- [urn](https://urn-lang.com)
- [lua-amalg](https://github.com/siffiejoe/lua-amalg)
- [luasrcdiet](https://github.com/jirutka/luasrcdiet)

# Install Dependencies
__*Disclaimer: This is only a quick setup guid for the dependencies needed. If you don't want to install anything with sudo, you can check out other installation methods on the homepage of the corresponding dependency.*__

Install lua 5.3 and luarocks

Install urn
```bash
git clone https://gitlab.com/urn/urn.git
sudo mv urn /opt/
echo "export PATH=/opt/urn/bin:\$PATH" >> ~/.bashrc
```

Install luasrcdiet
```bash
sudo luarocks install luasrcdiet
```

Install lua-amalg:
```bash
wget https://github.com/siffiejoe/lua-amalg/archive/master.tar.gz -O lua-amalg.tar.gz
tar xvf lua-amalg.tar.gz
sudo cp lua-amalg-master/src/amalg.lua /usr/local/bin/
```

# File Descriptions

## entry.lua
The entry.lua file is what imports and exposes your urn code

## SLOTS
The SLOTS file contains the slot definitions. One per file.

## src
This is where your urn code goes. Make sure there is a file named `main.urn` for the scripts to work

## build.sh
The build.sh file builds and packages your urn code into a DU consumable JSON file.

The is the following
1) compile the urn code (`build/build.lua`)
2) pack `build/build.lua` and `entry.lua` into `build/package.lua` using `lua-amalg`
3) minify `build/package.lua` into `build/package_min.lua` with `luasrcdiet`
4) wrap `build/package_min.lua` into the correct structure and save it into `out/final.json`

# Usage
1) Write urn code in your source folder
2) Change the slots according to your links
3) Call build.sh
4) Copy the content of `out/final.json`
5) In Dual Universe, right-click on the part you want the script running on and choose "Advanced -> Paste Lua Script"

# Example
There is example code in [src/main.urn](src/main.urn).

The example was created from the original example code which can be seen in [tools/README.md](tools/README.md).
