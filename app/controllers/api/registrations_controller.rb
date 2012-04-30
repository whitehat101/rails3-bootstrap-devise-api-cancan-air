class Api::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(params[:user])
    if user.save
      render :json=> user.as_json( :only => [ :email, :auth_token ] ), :status=> 201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=> 422
    end
  end
end
