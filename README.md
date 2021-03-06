
# support_sysstat

This module is designed to install sysstat on EL and Debian Linux systems to facilitate gathering troubleshooting data for Puppet Support cases.





#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with support_sysstat](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with support_sysstat](#beginning-with-support_sysstat)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Changelog](#changelog)

## Description

This module is designed to make it easier to capture relevant information on resource usage of Linux nodes, specifically in cases where this information will assist in troubleshooting tickets raised with Puppet Support.

This module will install sysstat on any required node if it is not already present, and configure it to summarise all captured data daily. It will also eventually add a mechanism to retrieve the captured data from any Linux node to the Puppet Master for passing to Puppet Support using Tasks.

## Setup


### Setup Requirements

This module requires the `puppetlabs-stdlib` module as a pre-requisite.


### Beginning with support_sysstat

To start with the `support_sysstat` module, simply include the `support_sysstat` class in your `site.pp` or use the Console to classify a node group with the `support_sysstat` class.

## Usage

Including the `support_sysstat` class in a node's classification will ensure that sysstat is installed, and for Debian based nodes it will also enable `sa2` processing of the binary data collected by `sa1`, which is not enabled by default on Debian and derivatives such as Ubuntu.

The `sa2` binary is called with the `-A` flag, which means that by default all the counters and datapoints will be returned. There is little overhead in doing this which is why it's not been changed from the default.

## Reference

There are 2 classes provided by this module:

* support_sysstat - Wrapper class to install and manage sysstat on Linux nodes.

* support_sysstat::install - Installs sysstat and ensures that the cron jobs are enabled.

## Limitations

This module is designed to work on EL and Debian based Linux distributions. Other Linux distributions may work but are not guaranteed to. In order to use this module on other Linux distros, you will need to fork the module and edit the `support_sysstat` class in `init.pp` to add further OS families to the conditional statement.

## Changelog

0.1.0 - Initial release.
0.2.0 - README Style and metadata.json updates.
0.3.0 - Update README.
