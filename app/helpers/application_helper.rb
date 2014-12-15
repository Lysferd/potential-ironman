module ApplicationHelper
  
  def button_get( name = nil, options = nil, html_options = { }, &block )
    html_options[:method] = :get
    return button_to( name, options, html_options, &block )
  end
  
  def button_delete( name = nil, options = nil, html_options = { }, &block )
    html_options[:method] = :delete
    return button_to( name, options, html_options, &block )
  end
  
  def admin_path
    return root_path
  end
  
end
