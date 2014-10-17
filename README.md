logstash-soap
=============

An [Logstash](http://logstash.net) SOAP output plugin for endpoints which uses WSDL.

Installation
------------

This is a bit hackish and might not work, so YMMV. This is going to be so much
easier when [elasticsearch/logstash#1507](https://github.com/elasticsearch/logstash/issues/1507) is done.

1. Change directory into the folder where logstash is installed, e.g. `/opt/logstash/`
2. Run:
```sh
for p in vendor/bundle/jruby/*; do
  export GEM_PATH=$p;
  java -jar vendor/jar/jruby-complete-*.jar -S gem install --install-dir $GEM_PATH --version '~> 2.7.2' savon
done
```
3. Copy `lib/logstash/outputs/soap.rb` into the `lib/logstash/outputs/` folder
   where logstash is installed, e.g.  `/opt/logstash/lib/logstash/outputs/`.

Usage
-----

See the comments in [lib/logstash/outputs/soap.rb](lib/logstash/outputs/soap.rb) since there's no RDOC
available.

License
=======
The plugin is released under the 3-clause BSD license.
