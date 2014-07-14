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
  end
end