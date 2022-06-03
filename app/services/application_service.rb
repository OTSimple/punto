class ApplicationService
  attr_reader(:response)

  def self.call(**args)
    new(**args).call
  end

  def build_success_response
    @response = ApplicationService::Response.new(success: true)
  end

  def build_failed_response(e)
    @response = ApplicationService::Response.new(success: false, errors: [e])
  end
end
