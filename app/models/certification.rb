class Certification < ActiveRecord::Base

  def user
    return User::find( self.user_id ).name
  end

  def product
    return Product::find( self.product_id ).label
  end

end
