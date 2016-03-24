#EXAMEN
module Napakalaki
require_relative 'statistics.rb'
require_relative 'Monster.rb'
require_relative 'Prize.rb'
require_relative 'TreasureKind.rb'
require_relative 'BadConsequence.rb'
module M1
  class ExamenViernes18
    def principal
      monsters = Array.new

      bad = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMETS], [])
      monsters << (Monster.new("El espía ciego", 4, bad, Prize.new(1,1)))

      bad = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
      monsters << (Monster.new("El Lenguas", 20, bad, Prize.new(1,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3, [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], [])
      monsters << (Monster.new("Bicéfalo", 20, bad, Prize.new(1,1)))

      M2::Statistics.compute(monsters)

    end
  end
end


M1::ExamenViernes18.new.principal
end
#EXAMEN
