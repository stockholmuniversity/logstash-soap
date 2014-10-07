require 'logstash/namespace'
require 'logstash/outputs/base'

# Write events to a HTTP SOAP endpoint via the Savon SOAP lib.

class LogStash::Outputs::SOAP < LogStash::Outputs::Base
  config_name 'soap'
  milestone 1

  public
  def register
  end # def register

  def receive(event)
  end
end #class LogStash::Outputs::SOAP
