  require_relative( "../models/bee.rb" )
  require_relative( "../models/food.rb" )
  require_relative( "../models/plant.rb" )
  require_relative( "../models/type.rb")
 #
 Food.delete_all()
 Bee.delete_all()
 Plant.delete_all()


   type1 = Type.new({
     "name" => "Bombus Hypnorum"
   })

   type2 = Type.new({
     "name" => "Bumblebee"
   })

   type3 = Type.new({
     "name" => "Leafcutter Bee"
   })

   type4 = Type.new({
     "name" => "Carpenter Bee"
   })

   type5 = Type.new({
     "name" => "Digger Bee"
   })



   type1.save()
   type2.save()
   type3.save()
   type4.save()
   type5.save()



  bee1 = Bee.new({
    "name" => "Digory",
    "type_id" => type1.id,
    "hunger_level" => 0
  })

  bee2 = Bee.new({
    "name" => "Joanna",
    "type_id" => type2.id,
    "hunger_level" => 0
  })

  bee3 = Bee.new({
    "name" => "Raphael",
    "type_id" => type3.id,
    "hunger_level" => 0
    })

  bee4 = Bee.new({
    "name" => "Marcin",
    "type_id" => type4.id,
    "hunger_level" => 90
    })

  bee5 = Bee.new({
    "name" => "Michael",
    "type_id" => type5.id,
    "hunger_level" => 0
    })

bee6 = Bee.new({
"name" => "Victoria",
"type_id" => type5.id,
"hunger_level" => 0
})


  bee1.save()
  bee2.save()
  bee3.save()
  bee4.save()
  bee5.save()
  bee6.save()




  plant1 = Plant.new({
    "name" => "Lavender",
    "season" => "Autumn",
    "pollen" => 10
    })

  plant2 = Plant.new({
    "name" => "Dahlia",
    "season" => "Autumn",
    "pollen" => 10
    })

  plant3 = Plant.new({
    "name" => "Japanese Anemone",
    "season" => "Autumn",
    "pollen" => 15
    })

  plant4 = Plant.new({
    "name" => "Wild marjoram plant",
    "season" => "Summer",
    "pollen" => 10
    })

  plant5 = Plant.new({
    "name" => "Foxglove",
    "season" => "Summer",
    "pollen" => 20
  })

  plant6 = Plant.new({
    "name" => "Snapdragon",
    "season" => "Summer",
    "pollen" => 20
  })

  plant7 = Plant.new({
    "name" => "Rosemary",
    "season" => "Winter",
    "pollen" => 5
    })

  plant8 = Plant.new({
    "name" => "Crocus",
    "season" => "Winter",
    "pollen" => 5
    })

  plant9 = Plant.new({
    "name" => "Primrose",
    "season" => "Winter",
    "pollen" => 20
    })

  plant10 = Plant.new({
    "name" => "Dwarf Russian Almond",
    "season" => "Spring",
    "pollen" => 30
    })

  plant11 = Plant.new({
    "name" => "Judas Tree",
    "season" => "Spring",
    "pollen" => 30
    })

  plant12 = Plant.new({
    "name" => "Elephant Ear",
    "season" => "Spring",
    "pollen" => 5
    })

  plant1.save()
  plant2.save()
  plant3.save()
  plant4.save()
  plant5.save()
  plant6.save()
  plant7.save()
  plant8.save()
  plant9.save()
  plant10.save()
  plant11.save()
  plant12.save()

  food1 = Food.new({
    "plant_id" => plant1.id,
    "bee_id" => bee1.id
    })

  food2 = Food.new({
    "plant_id" => plant1.id,
    "bee_id" => bee2.id
  })

  food3 = Food.new({
    "plant_id" => plant2.id,
    "bee_id" => bee3.id
  })

  food4 = Food.new({
    "plant_id" => plant2.id,
    "bee_id" => bee4.id
  })

  food5 = Food.new({
    "plant_id" => plant3.id,
    "bee_id" => bee4.id
  })

  food6 = Food.new({
    "plant_id" => plant4.id,
    "bee_id" => bee5.id
  })

  food7 = Food.new({
    "plant_id" => plant5.id,
    "bee_id" => bee5.id
  })

  food8 = Food.new({
    "plant_id" => plant6.id,
    "bee_id" => bee6.id
  })

  food9 = Food.new({
    "plant_id" => plant7.id,
    "bee_id" => bee6.id
  })

  food10 = Food.new({
    "plant_id" => plant8.id,
    "bee_id" => bee1.id
  })

  food11 = Food.new({
    "plant_id" => plant9.id,
    "bee_id" => bee2.id
  })

  food12 = Food.new({
    "plant_id" => plant10.id,
    "bee_id" => bee6.id
  })

  food13 = Food.new({
    "plant_id" => plant11.id,
    "bee_id" => bee2.id
  })

  food14 = Food.new({
    "plant_id" => plant12.id,
    "bee_id" => bee5.id
  })

  food1.save()
  food2.save()
  food3.save()
  food4.save()
  food5.save()
  food6.save()
  food7.save()
  food8.save()
  food9.save()
  food10.save()
  food11.save()
  food12.save()
  food13.save()
  food14.save()
