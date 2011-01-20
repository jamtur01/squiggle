# Squiggle

Squiggle is a squiggly Puppet API wrapper.

It's named in honour of [Mr Squiggle](http://en.wikipedia.org/wiki/Mr_Squiggle)

## Installation

Install Mr Squiggle via Miss Jane or via Rubygems:

    gem install squiggle
   
You can also get the source from https://github.com/jamtur01/squiggle.

## Configuration

Squiggle has five configuration variables: 

    Squiggle.host          # default: localhost
    Squiggle.port          # default: 8140
    Squiggle.scheme        # default: https
    Squiggle.key           # default: nil
    Squiggle.cert          # default: nil
    Squiggle.cacert        # default: nil

You will need the key, certificate from an authenticated Puppet client (or authenticate your client 
as a Puppet client) and the CA cert from the Puppet master you are connecting to.

You will need to ensure your `/etc/puppet/auth.conf` file allows the appropriate access from that client 
to the API path you wish to access.  You can see details on the `auth.conf` file [here](http://docs.puppetlabs.com/guides/security.html#authconf).

To connect to a Puppet master at https://puppet.example.com:8140:

    Squiggle.host = "puppet.example.com"
    Squiggle.port = "8140"
    Squiggle.scheme = "https"
    Squiggle.key = "/path/to/key.pem"
    Squiggle.cert = "/path/to/cert.pem"
    Squiggle.cacert = "/path/to/ca_crt.pem"

You can also use the squiggle.setup block if you prefer this style:

    Squiggle.setup do |s|
      s.host = "puppet.example.com"
      s.port = "5000"
      s.scheme = "https"
      s.key = "/path/to/key.pem"
      s.cert = "/path/to/cert.pem"
      s.cacert = "/path/to/ca_crt.pem"
    end

After you have configured Squiggle, we need to create a connection:

    Squiggle.connect!
    
If you want to reset your configiuration to their default values:

    Squiggle.reset!

## Usage

Setting up Squiggle and running `Squiggle.connect!` creates a connection object that can then be used to send requests to your Puppet master, accessed via `Squiggle.connection`.  

For example to return the CA certificate:

    Squiggle.connection.get("/certificate/ca")

You can see details of the Puppet REST API [here](http://docs.puppetlabs.com/guides/rest_api.html).

## Copyright

Copyright (c) 2010 James Turnbull. See LICENSE.txt for
further details.
