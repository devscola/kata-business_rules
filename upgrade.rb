class Upgrade<Product
  def initialize a_membership
    @subject = a_membership
    super(:upgrade)
  end
end