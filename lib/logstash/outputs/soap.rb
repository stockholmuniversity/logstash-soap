require 'logstash/namespace'
require 'logstash/outputs/base'

# Write events to a HTTP SOAP endpoint via the Savon SOAP lib.

class LogStash::Outputs::SOAP < LogStash::Outputs::Base
  config_name 'soap'
  milestone 1

  # FIXME
  # The URI to the WSDL. This can be an URL or a local file. E.g. "https://soap.example.com/?wsdl" or "/var/cache/service.wsdl"
  config :wsdl, :validate => :string, :required => true

  # FIXME
  # The path to the CA file to use for SSL validation, e.g: "/etc/ssl/certs/ca-certificates.crt"
  config :ssl_cafile, :validate => :string, :required => true

  # FIXME
  # The SOAP method we should submit to, e.g: "AddService"
  config :soap_method, :validate => :string, :required => true

  # FIXME
  # The name of the hash in the event which hold what should be sent as the body of the SOAP message. E.g: "soap_body"
  config :soap_body, :validate => :string, :required => true, :default => "soap_body"

  public
  def register
  end # def register

  def receive(event)
  end
end #class LogStash::Outputs::SOAP
