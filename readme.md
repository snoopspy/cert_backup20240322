SSL Certificate Manager
=======================

# Install
  * Run _make_root.sh to create root certificate files if necessary.
  * Register root/root.crt in your system's SSL certificate repository.

# Usage
  * Run _clear_site.sh to clear all site certificate files(same as git clean -fxd).
  * Run _make_root.sh if necessary.
  * Run _init_site.sh to initialize the folder.
  * Run _make_site.sh to create site certificate files.
