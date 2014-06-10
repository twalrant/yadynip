# Introduction

Yet Another Dynamic IP controller is an utility used to detect and act
upon WAN IP change. It operates in two steps, the detection of the
current WAN IP address and the execution of registered actions.

## Detection phase:

The tool accepts multiple ways to detect the WAN IP address by
executing different checkip scripts until an IP address is found (See
the checkip.d folder for examples of available methods/scripts). You
can add your own method and/or disable some scripts. Scripts without
configuration are silently ignored.

## Actions phase:

Once the IP address is detected, the tool check the requirement to
execute all available actions (located in folder actions.d). It
executes the action script only if the IP address has changed. The IP
address is cached per action upon succesfull execution of the action,
so that the tool is able to only repeat the action who failed at the
previous attempt. Action scripts without configuration are silently
failing, hence will be repeated every time.

# Installation

Run the bash script install.sh without argument. This will install
files in default installation directory (/usr/local). Alternatively,
the install.sh script can take one argument to specify another
installation directory.

# Limitation

The yadynip execution from the default installation setup
(installdir=/usr/local) requires root access. The cache data is stored
in folder writable to root only (i.e.: /usr/local/share/yadynip).

A user without root permissions can execute yadynip by changing the
default cache data folder. It is possible to change the cache data
folder is a configuration file: set variable 'sharedir' to a folder
with write permissions.

# Configuration

The tool supports different locations for the configuration file in
the following order:

- ${installdir}/etc/yadynip.conf
- $HOME/.yadynip.conf
- ./yadynip.conf

See etc/yadynip.conf for configurable parameters details.
