class ApplicationController < ActionController::Base
  private

  def guest_pseudo_authentication_key(key)
    key ||= Faker::Name.name
  end
end
