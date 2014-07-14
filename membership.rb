require './product'

class Membership < Product

  def initialize
    super :membership
  end
  
  def is_active?
  end
  
end