module ApplicationHelper
  
  def is_admin?
    return User::find_by_id( session[:user_id] ).permission == 0
  end
  
  def button_get( name = nil, options = nil, html_options = { }, &block )
    html_options[:method] = :get
    return button_to( name, options, html_options, &block ) 
  end
  
  def button_delete( name = nil, options = nil, html_options = { }, &block )
    html_options[:method] = :delete
    return button_to( name, options, html_options, &block ) 
  end
  
end
