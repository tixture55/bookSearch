class RegistrationsController < Devise::RegistrationsController

  
  def new
    build_resource({})
    respond_with self.resource
  end

end
