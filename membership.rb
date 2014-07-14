require './product'

class Membership < Product

  def initialize
    @active=false
    super :membership
  end
  
  def is_active?
    @active
  end

  def is_a_membership?
    true
  end 

  def activate
    @active=true
  end

  def upgrade
    @upgraded = true
  end
  
  def upgraded?
    @upgraded
  end
end