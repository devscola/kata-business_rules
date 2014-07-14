class Product
  def initialize description
    @description=description
  end
  
  def is_a_book?
    @description == :book
  end 

  def is_a_membership?
    false
  end 

end