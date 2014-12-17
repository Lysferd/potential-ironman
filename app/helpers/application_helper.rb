module ApplicationHelper
  
  def button_get( name = nil, options = nil, html_options = { }, &block )
    html_options[:method] = :get
    name = t( name ) if name.kind_of?( Symbol )
    return button_to( name, options, html_options, &block )
  end
  
  def button_delete( name = nil, options = nil, html_options = { }, &block )
    html_options[:method] = :delete
    name = t( name ) if name.kind_of?( Symbol )
    return button_to( name, options, html_options, &block )
  end
  
    def link_image( src, alt, path, html_options = { } )
    img = image_tag( src, { border: 0, alt: t( alt ) } )
    return link_to( img, path, html_options )
  end
  alias :image_get :link_image

  def image_delete( src, alt, path, html_options = { } )
    html_options[:method] = :delete
    html_options[:data] = { confirm: t( :destroy_confirmation ) }
    return link_image( src, alt, path, html_options )
  end

  def user_signed_in?
    !!session[:user_id]
  end

  def current_user
    User::find( session[:user_id] ) if user_signed_in?
  end

  # DEPRECATED
  def admin_path
    return root_path
  end
  
end
