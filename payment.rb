class Payment
  def initialize product
    @product = product
  end

  def is_for_a_book?
    @product.is_a_book?
  end

  def fulfilled
    mails=[]
    mails << @product.activate if @product.is_a_membership?
    mails << @product.upgrade if @product.is_an_upgrade?
    mails
  end
end