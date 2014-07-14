class Upgrade<Product
  
  def initialize a_membership
    @subject = a_membership
    super(:upgrade)
  end

  def is_an_upgrade?
    true
  end

  def upgrade
    @subject.upgrade
    "Your membership has been upgraded"
  end
end