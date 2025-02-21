Electrum-DOGE - Lightweight Dogecoin client
=====================================

::

  Licence: GNU GPLv3+ for Electrum-DOGE components; CC BY 4.0 for Dogecoin logo, MIT Licence for all other components
  Author: The Dogecoin developers; based on Electrum by Thomas Voegtlin and Electrum-DOGE by The Electrum-DOGE contributors
  Language: Python (>= 3.6)
  Homepage: https://www.dogecoin.org/ ; original Electrum Homepage at https://electrum.org/


.. image:: https://travis-ci.org/dogecoin/electrum-doge.svg?branch=master
    :target: https://travis-ci.org/dogecoin/electrum-doge
    :alt: Build Status
.. image:: https://coveralls.io/repos/github/dogecoin/electrum-doge/badge.svg?branch=master
    :target: https://coveralls.io/github/dogecoin/electrum-doge?branch=master
    :alt: Test coverage statistics
.. image:: https://d322cqt584bo4o.cloudfront.net/electrum/localized.svg
    :target: https://crowdin.com/project/electrum
    :alt: Help translate Electrum online





Getting started
===============

(*If you've come here looking to simply run Electrum-DOGE,* `you may download it here`_.)

.. _you may download it here: https://www.dogecoin.org/download/betas/

Electrum-DOGE itself is pure Python, and so are most of the required dependencies,
but not everything. The following sections describe how to run from source, but here
is a TL;DR::

    sudo apt-get install libsecp256k1-0
    python3 -m pip install --user .[gui,crypto]


Not pure-python dependencies
----------------------------

If you want to use the Qt interface, install the Qt dependencies::

    sudo apt-get install python3-pyqt5

For elliptic curve operations, `libsecp256k1`_ is a required dependency::

    sudo apt-get install libsecp256k1-0

Alternatively, when running from a cloned repository, a script is provided to build
libsecp256k1 yourself::

    sudo apt-get install automake libtool
    ./contrib/make_libsecp256k1.sh

Due to the need for fast symmetric ciphers, `cryptography`_ is required.
Install from your package manager (or from pip)::

    sudo apt-get install python3-cryptography


If you would like hardware wallet support, see `this`_.

.. _libsecp256k1: https://github.com/bitcoin-core/secp256k1
.. _pycryptodomex: https://github.com/Legrandin/pycryptodome
.. _cryptography: https://github.com/pyca/cryptography
.. _this: https://github.com/spesmilo/electrum-docs/blob/master/hardware-linux.rst

Running from tar.gz
-------------------

If you downloaded the official package (tar.gz), you can run
Electrum-DOGE from its root directory without installing it on your
system; all the pure python dependencies are included in the 'packages'
directory. To run Electrum-DOGE from its root directory, just do::

    ./run_electrum_doge

You can also install Electrum-DOGE on your system, by running this command::

    sudo apt-get install python3-setuptools python3-pip
    python3 -m pip install --user .

This will download and install the Python dependencies used by
Electrum-DOGE instead of using the 'packages' directory.
It will also place an executable named :code:`electrum-doge` in :code:`~/.local/bin`,
so make sure that is on your :code:`PATH` variable.


Development version (git clone)
-------------------------------

Check out the code from GitHub::

    git clone git://github.com/dogecoin/electrum-doge.git
    cd electrum-doge
    git submodule update --init

Run install (this should install dependencies)::

    python3 -m pip install --user -e .


Compile the Qt UI::

    sudo apt-get install pyqt5-dev-tools
    ./contrib/make_qt_forms

Copy over the www root::

    rm -rf electrum_doge/electrum/www
    cp -a electrum/www electrum_doge/electrum/www

Create translations (optional)::

    sudo apt-get install python-requests gettext
    ./contrib/pull_locale

Finally, to start Electrum-DOGE::

    ./run_electrum_doge



Creating Binaries
=================

Linux (tarball)
---------------

See :code:`contrib/build-linux/sdist/README.md`.


Linux (AppImage)
----------------

See :code:`contrib/build-linux/appimage/README.md`.


Mac OS X / macOS
----------------

See :code:`contrib/osx/README.md`.


Windows
-------

See :code:`contrib/build-wine/README.md`.


Android
-------

See :code:`contrib/android/Readme.md`.



AuxPoW Branch
=============

Electrum-DOGE also maintains an ``auxpow`` branch.  This branch is identical to the upstream Bitcoin version of Electrum (e.g. it doesn't have any name support or Dogecoin rebranding), except that it supports AuxPoW (merged mining).  It may be useful as a starting point for porting Electrum to other AuxPoW-based cryptocurrencies.
