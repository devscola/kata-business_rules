class Payment
  def initialize product
    @product = product
  end

  def is_for_a_book?
    @product.is_a_book?
  end

  def fulfilled
    @product.activate if @product.is_a_membership?
  end
end