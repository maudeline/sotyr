class Dish
  QUALITY = {
    bad: 0,
    poor: 1,
    normal: 2,
    good: 3,
    excellent: 4,
    perfect: 5
  }.freeze

  def initialize(appliance, ingredients, equiptment, skill_level, times_made, recipe_quality)
    @appliance = appliance
    @ingredients = ingredients
    @equiptment = equiptment
    @skill_level = skill_level
    @times_made = times_made
    @recipe_quality = recipe_quality
  end

  def quality(_known_recipe, _made_count)
    quality = 10
    ingredient_quality = calculate_quality(ingredients)
    equiptment_quality = calculate_quality(equiptment)
    appliance_quality = QUALITY[appliance.quality]
    ingredient_quality + equiptment_quality + appliance_quality + quality
  end

  private

  attr_reader :ingredients, :equiptment, :appliance
  attr_writer :quality

  def calculate_quality(items)
    return 0 if items.empty?
    sum_quality(items) / items.length
  end

  def sum_quality(items)
    items.inject(0) { |acc, item| acc + QUALITY[item.quality] }
  end
end
