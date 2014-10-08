logstash-soap
=============

An [Logstash](http://logstash.net) SOAP output plugin for endpoints which uses WSDL.

Installation
------------

This is a bit hackish and might not work, so YMMV. This is going to be so much
easier when logstash#1507 is done.

# Change directory into the folder where logstash is installed, e.g. `/opt/logstash/`
# Run ```
$ gem install --install-dir vendor/bundle/jruby/1.9/ --version '~> 2.7.2' savon
```

Usage
-----

See the comments in [lib/logstash/outputs/soap.rb] since there's no RDOC
available.

License
=======
The plugin is released under the 3-clause BSD license.
