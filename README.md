
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

This module will install sysstat on any required node if it is not already present, and configure it to summarise all captured data daily. It also includes a number of tasks to make it simpler to see the captured metrics within the Console.

## Setup


### Setup Requirements

This module requires the `puppetlabs-stdlib` module as a pre-requisite.


### Beginning with support_sysstat

To start with the `support_sysstat` module, simply include the `support_sysstat` class in your `site.pp` or use the Console to classify a node group with the `support_sysstat` class.

## Usage

Including the `support_sysstat` class in a node's classification will ensure that sysstat is installed, and for Debian based nodes it will also enable `sa2` processing of the binary data collected by `sa1`, which is not enabled by default on Debian and derivatives such as Ubuntu.

The `sa2` binary is called with the `-A` flag, which means that by default all the counters and datapoints will be returned. There is little overhead in doing this which is why it's not been changed from the default.

This module also includes 3 Tasks:
* A task to return all captured metrics for the current day with an optional `start` and `end` parameter to enable time bounds. These parameters must be entered in `HH:MM:SS` format.
* A task that allows only specific metrics to be returned. The required metrics can simply be selected by changing a required parameter to `true`. The available metrics are `block`(block device metrics), `network` (network metrics), `processors` (CPU metrics), `memory` (memory metrics), `swap` (swap metrics) and `tables` (file and inode table metrics). There are also the same optional time bound as for the previous task.
* A task that returns all or selected metrics for any given day for which there is a `saXX` file in the save directory. The day of the month must be provided in a 2 digit `DD` format and there is the same optional time bound available within that day as for the previous two tasks.

## Reference

There are 2 classes provided by this module:

* support_sysstat - Wrapper class to install and manage sysstat on Linux nodes.

* support_sysstat::install - Installs sysstat and ensures that the cron jobs are enabled.

There are also 3 tasks provided by this module:

* support_sysstat::snapshot - Task to display all captured metrics for the current day in the Console.

* support_sysstat::filtered_snapshot - Task to display only selected metrics for the current day in the Console.

* support_sysstat::freeform_parse - Task to return metrics from any previous day stored in the save directory in the Console.

## Limitations

This module is designed to work on EL and Debian based Linux distributions. Other Linux distributions may work but are not guaranteed to. In order to use this module on other Linux distros, you will need to fork the module and edit the `support_sysstat` class in `init.pp` to add further OS families to the conditional statement.

## Changelog

0.1.0 - Initial release.\
0.2.0 - README Style and metadata.json updates.\
0.3.0 - Update README.\
0.4.0 - Added Tasks.
