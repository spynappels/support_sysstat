
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
6. [Development - Guide for contributing to the module](#development)

## Description

This module is designed to make it easier to capture relevant information on resource usage of Linux nodes, specifically in cases where this information will assist in troubleshooting tickets raised with Puppet Support.

This module will install sysstat on any required node if it is not already present, and configure it with some sane defaults to capture basic resource data. It will also eventually allow less common data capture options to be enabled at will, as well as adding a mechanism to retrieve the captured data from any Linux node to the Puppet Master for passing to Puppet Support.

## Setup


### Setup Requirements

This module requires the `puppetlabs-stdlib` module as a pre-requisite.


### Beginning with support_sysstat

To start with the `support_sysstat` module, simply include the `support_sysstat` class in your `site.pp` or use the Console to classify a node group with the `support_sysstat` class.

## Usage

Work in Progress.

## Reference

Users need a complete list of your module's classes, types, defined types providers, facts, and functions, along with the parameters for each. You can provide this list either via Puppet Strings code comments or as a complete list in the README Reference section.

* If you are using Puppet Strings code comments, this Reference section should include Strings information so that your users know how to access your documentation.

* If you are not using Puppet Strings, include a list of all of your classes, defined types, and so on, along with their parameters. Each element in this listing should include:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

## Limitations

This module is designed to work on EL and Debian based Linux distributions. Other Linux distributions may work but are not guaranteed to.

## Development

Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
