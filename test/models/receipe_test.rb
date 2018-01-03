require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create!(chefname: "chef", email: "chef@mail.com")
    @recipe = @chef.recipes.build(name: "test recipe", description: "test description here")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "name should not be empty" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "description should not be empty" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
  test "description should be at least 5 chars" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end
  
  test "description should be no more than 500 chars" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end  

  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  
end