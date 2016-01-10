require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
   @chef = Chef.new(chefname: "Pushkar",email: "pushkar@example.com")
  end
  
  test "name should be present" do
    assert @chef.valid?
  end
  
  test "name should be less than 41 char long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
    
  end
  
  test "name should be more than 3 char long" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end

end