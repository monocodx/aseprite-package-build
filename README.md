# Aseprite Package Build

Dockerfile instructions to build Aseprite package for Linux distributions.

## Quick Start

### Build Package
Update the `build.cfg` file to set the Aseprite version and build target platform, then run the `build.sh` script.
```
# target options:
# opensuse-tumbleweed, opensuse-leap, fedora-rawhide, fedora, debian-stable

TARGET=opensuse-tumbleweed
```
Find the Aseprite version from [Aseprite Github repository](https://github.com/aseprite/aseprite/releases).

### Runtime shared library
Built Aseprite package requires the `libc++.so.1` shared library to run on the installed platform.  

On openSUSE:  
```
sudo zypper install libc++1
```

On Debian/Ubuntu:  
```
sudo apt-get install libc++1
```

On Fedora:  
```
sudo dnf install libcxx
```

### Development
Refer to [development guidelines](./DEVELOPMENT.md).

## FAQ
1. Why not provide a built package instead of requiring users to build it themselves?  
From August 2016 end user cannot redistribute compiled versions of Aseprite. Aseprite replaced the General Public License (GPLv2) with the new Aseprite EULA. [[source]](https://www.aseprite.org/faq/#can-i-redistribute-aseprite)  

2. Why does the Aseprite build from source have `dev` appended at the end of the app window title?  
Please refer to Aseprite developer comment. [[source]](https://github.com/aseprite/aseprite/issues/2520#issuecomment-696978431)  

## LICENSE
Aseprite Package Build is licensed under the [GNU GPLv3](./LICENSE).
