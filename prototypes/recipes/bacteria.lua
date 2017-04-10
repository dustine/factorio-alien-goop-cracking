if angelsmods and angelsmods.bioprocessing then
  data:extend {{
    type = "recipe",
    name = "alien-goop-cracking-bacteria",
    category = "bio-processing",
    subgroup = "bio-processing-alien-intermediate",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {type="fluid", name="alien-goop-cracking-goop", amount=1},
      {type="item", name="solid-calcium-carbonate", amount=2}
    },
    results = {
      {type="item", name="alien-bacteria", amount=1},
    },
    order = "b [alien-bacteria]",
    main_product = "alien-bacteria"
  }}

  table.insert(data.raw['technology']['alien-technology'].effects, {
    type = 'unlock-recipe',
    recipe = 'alien-goop-cracking-bacteria'
  })
end