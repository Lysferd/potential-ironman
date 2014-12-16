class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  before_filter :check_for_cancel, :only => [:create, :update]
  skip_before_filter :require_no_authentication

  def check_permissions
    #authorize! :create, resource
  end
  
  private
  #def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up).push(:name, role_ids: [ ])
  #end

  def sign_up_params
    allow = [ :name, :email, :password, :password_confirmation, :role_ids ]
    params.require( resource_name ).permit( allow )
  end
  
  # Cancels data update/creation in case cancel button is pressed.
  def check_for_cancel
    redirect_to( users_path, notice: 'Changes discarded.' ) if params[:commit] == 'Cancel'
  end
end
