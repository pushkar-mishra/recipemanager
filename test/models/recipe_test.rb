require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "Pushkar",email: "pushkar@example.com")
    @recipe = @chef.recipes.build(name: "Baigan Bhartha",summary: "This is best Bigan dish.",description: "This can be made with biagan,salt and papper.BLAH BLAH etc etc...")
  end
  
  test "name should be present" do
    assert @recipe.valid?
  end
  
  test "name should be more than 5 char long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
    
  end
  
  test "Name should be less than 100 char long" do
    @recipe.name = "aaa"
    assert_not @recipe.valid?
  end

end