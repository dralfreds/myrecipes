require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @c = Chef.create!(chefname: "chef2", email: "chef2@mail.com")
    @r = Recipe.create(name: "best onion soup",  description: "instant packet is good", chef: @c)
    @r2 = Recipe.create(name: "best tomato soup",  description: "instant packet is even better", chef: @c)
    @r3 = @c.recipes.build(name: "chicken soup", description: "instant soup as well")
    @r3.save
  end
  
  test "should get receipes index" do
    get recipes_path
    assert_response :success
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @r.name, response.body
    assert_match @r2.name, response.body
  end
  
end
