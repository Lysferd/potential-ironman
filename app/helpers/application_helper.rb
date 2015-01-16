module ApplicationHelper
  
  #-------------------------------------------------------------------------
  # * Form Helpers
  #-------------------------------------------------------------------------
  def button_get( name = nil, options = nil, html_options = { }, &block )
    html_options[:method] = :get
    html_options[:remote] = true
    name = t( name ) if name.kind_of?( Symbol )
    return button_to( name, options, html_options, &block )
  end
  
  def button_delete( name = nil, options = nil, html_options = { }, &block )
    html_options[:method] = :delete
    html_options[:remote] = true
    html_options[:data] = { confirm: t( :destroy_confirmation ) }
    name = t( name ) if name.kind_of?( Symbol )
    return button_to( name, options, html_options, &block )
  end
  
  def link_image( src, alt, path, html_options = { } )
    img = image_tag( src, { border: 0, alt: t( alt ) } )
    html_options[:remote] = true
    return link_to( img, path, html_options )
  end
  alias :image_get :link_image

  def image_show( object, controller = controller_name, html_options = { } )
    return unless can?( :read, object )
    path = "/#{controller}/#{object.id}"
    src = 'show.svg'
    alt = :show
    return link_image( src, alt, path, html_options )
  end

  def image_edit( object, controller = controller_name, html_options = { } )
    return unless can?( :edit, object )
    path = "/#{controller}/#{object.id}/edit"
    src = 'edit.svg'
    alt = :edit
    return link_image( src, alt, path, html_options )
  end

  def image_delete( object, controller = controller_name, html_options = { } )
    return unless can?( :destroy, object )
    path = "/#{controller}/#{object.id}"
    src = 'destroy.svg'
    alt = :destroy
    html_options[:method] = :delete
    html_options[:data] = { confirm: t( :destroy_confirmation ) }
    return link_image( src, alt, path, html_options )
  end

  def remote_link( name, path, html_options = { } )
    html_options[:remote] = true
    return link_to( name, path, html_options )
  end

  def table_width( columns )
    if desktop? or tablet?
      return "width: #{500 + 100 * (columns - 1)}px;"
    else
      return 'width: auto;'
    end
  end

  #-------------------------------------------------------------------------
  # * Logic Helpers
  #-------------------------------------------------------------------------
  def user_signed_in?
    !!cookies[:auth_token]
  end

  def current_user
    User::find_by_auth_token( cookies[:auth_token] ) if cookies[:auth_token]
  end

  def desktop?
    !tablet_or_mobile?
  end

  def tablet?
    browser.tablet?
  end

  def mobile?
    browser.mobile?
  end

  def tablet_or_mobile?
    browser.mobile? or browser.tablet?
  end
  alias :mobile_or_tablet? :tablet_or_mobile?

  def models
    models = [ ]
    Dir[Rails::root.join( 'app/models/*.rb' ).to_s].each do | f |
      m = File::basename( f, '.rb' ).camelize
      models.push m if m.constantize.ancestors.include? ActiveRecord::Base
    end
    return models
  end
end
