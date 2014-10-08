require 'logstash/namespace'
require 'logstash/outputs/base'

# Write events to a HTTP SOAP endpoint via the Savon SOAP lib.

class LogStash::Outputs::SOAP < LogStash::Outputs::Base
  config_name 'soap'
  milestone 1

  # The URI to the WSDL. This can be an URL or a local file. E.g. "https://soap.example.com/?wsdl" or "/var/cache/service.wsdl"
  config :wsdl, :validate => :string, :required => true

  # The path to the CA file to use for SSL validation, e.g: "/etc/ssl/certs/ca-certificates.crt"
  config :ssl_cafile, :validate => :string, :required => true

  # The SOAP method we should submit to, e.g: "AddService"
  config :soap_method, :validate => :string, :required => true

  # FIXME
  # The name of the hash in the event which hold what should be sent as the body of the SOAP message. E.g: "soap_body"
  config :soap_body, :validate => :string, :required => true, :default => "soap_body"

  public
  def register
    @logger.info('Registering SOAP producer', :wsdl => @wsdl, :soap_method => @soap_method)
    @logger.debug('Loading gem')
    require 'savon'

    @soap_method = @soap_method.snakecase.to_sym

    @client = Savon.client(
      wsdl: @wsdl,
      ssl_ca_cert_file: @ssl_cafile,
      ssl_verify_mode: :peer
      # FIXME Needs ruby-cabin#23 to be fixed before enabling
      # log: true,
      # log_level: :debug,
      # pretty_print_xml: true,
      # logger: @logger
    )

  end # def register

  def receive(event)
    return unless output?(event)

    response = nil
    begin
      response = @client.call(@soap_method, :message => event[@soap_body])
    rescue LogStash::ShutdownSignal
      @logger.info('SOAP plugin got shutdown signal')
    rescue => e
      @logger.error('SOAP plugin threw exception',
                   :event => event,
                   :exception => e,
                   :backtrace => e.backtrace)
    end
    @logger.debug("SOAP response:", :response => response)
    if event == LogStash::SHUTDOWN
      finished
      return
    end

  end # def receive

end #class LogStash::Outputs::SOAP
