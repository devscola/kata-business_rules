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
    "Your membership has been activated"
  end

  def upgrade
    @upgraded = true
    "Your membership has been upgraded"
  end
  
  def upgraded?
    @upgraded
  end
end