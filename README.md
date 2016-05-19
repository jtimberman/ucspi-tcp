# ucspi-tcp Cookbook

Installs [DJB's ucspi-tcp](http://cr.yp.to/ucspi-tcp.html) software.

# Requirements

## Platform

The following platforms are supported, and tested via Test Kitchen.

- Ubuntu / Debian
- RHEL / Fedora

This cookbook may work on other versions of these platform / platform families with or without modification.

The following platforms are supported on a best effort basis.

- ArchLinux
- Gentoo

## Cookbooks

- build-essential: for source recipe
- pacman: for AUR installation on ArchLinux

# Attributes

- `node['ucspi']['install_method']`: the method of installation, which tells the default recipe which recipe to load. default is `package` for most platforms, and `source` for RHEL. It is `aur` for ArchLinux as Arch doesn't have ucspi-tcp package in the default repositories. See **Usage** below.
- `node['ucspi']['bin_dir']`: location of the installed binaries. the default is `/usr/bin` for package and aur install methods, and `/usr/local/bin` for source installs.

# Usage

Include the ucspi-tcp recipe in the run list. The installation method will automatically be selected based on what we consider to be sane defaults.

## Installing from Package on RHEL

If you have an internal package of `ucspi-tcp` for RHEL and wish to use that, then either specifically use the `package` recipe, or set the `install_method` attribute to `package` for your node/role/environment.

# Bugs

Please [report bugs](https://github.com/jtimberman/ucspi-tcp) with this cookbook. Include the following information:

- Chef version (`chef-client --version`)
- Platform and platform version (`ohai platform` and `ohai platform_version`)
- Version of this cookbook used
- Output of the error, and Chef stacktrace
- Steps to reproduce

# License & Authors

- Author: Joshua Timberman ([joshua@chef.io](mailto:joshua@chef.io))

```text
Copyright 2010-2016, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
