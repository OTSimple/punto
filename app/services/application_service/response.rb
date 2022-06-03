class ApplicationService::Response
  attr_reader(
    :success,
    :errors
  )
  def initialize(success:, errors: [])
    @success = success  
    @errors = errors
  end

  alias :success? :success
end