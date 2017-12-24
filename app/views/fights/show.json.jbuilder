json.(@fight, :created_at, :updated_at, :id)
json.character_fights @fight.character_fights do |character_fight|
  json.(character_fight, :created_at, :updated_at, :id, :delta_experience, :result)
  json.character do
      json.(character_fight.character, :created_at, :updated_at, :id, :experience, :attack, :lifepoints, :picture, :name)
  end
  json.weapon do
      json.(character_fight.weapon, :created_at, :updated_at, :id, :force, :picture, :name)
  end
end
