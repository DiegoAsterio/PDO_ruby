#encoding utf-8
module Napakalaki
  require_relative 'Monster.rb'
  require_relative 'Prize.rb'
  require_relative 'TreasureKind.rb'
  require_relative 'BadConsequence.rb'
  class Napakalaki

    def self.run
      monsters = Array.new

      bad = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.", 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      monsters << (Monster.new("2 Byakhees de bonanza", 8, bad, Prize.new(2,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.", 0, [TreasureKind::HELMETS], [])
      monsters << (Monster.new("Chibithulhu", 2, bad, Prize.new(1,1)))

      bad = BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso. Pierdes el calzado visible.", 0, [TreasureKind::SHOES], [])
      monsters << (Monster.new("El sopor de Dunwich", 2, bad, Prize.new(1,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      monsters << (Monster.new("Ángeles de la noche ibicenca", 14, bad, Prize.new(4,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Pierdes todos tus tesoros visibles.", 0, [TreasureKind::ARMOR, TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::SHOES, TreasureKind::HELMETS], [])
      monsters << (Monster.new("El gorrón en el umbral", 10, bad, Prize.new(3,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.", 0, [TreasureKind::ARMOR], [])
      monsters << (Monster.new("H.P. Munchcraft", 6, bad, Prize.new(2,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible.", 0, [TreasureKind::ARMOR], [])
      monsters << (Monster.new("Bichgooth", 2, bad, Prize.new(1,1)))

      bad = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0)
      monsters << (Monster.new("El rey de rosa", 13, bad, Prize.new(4,2)))

      bad = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
      monsters << (Monster.new("La que redacta en las sombras", 3, bad, Prize.new(1,1)))

      bad = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
      monsters << (Monster.new("Los hondos verdes", 7, bad, Prize.new(2,1)))

      bad = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2)
      monsters << (Monster.new("Semillas Cthulhu", 4, bad, Prize.new(2,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Te intentas escapar. Pierdes una mano visible.", 0, [TreasureKind::ONEHAND], [])
      monsters << (Monster.new("Dameargo", 1, bad, Prize.new(2,1)))

      bad = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
      monsters << (Monster.new("Pollipólipo volante", 3, bad, Prize.new(1,1)))

      bad = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estás muerto.")
      monsters << (Monster.new("Yskhtihyssg-Goth", 12, bad, Prize.new(3,1)))

      bad = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
      monsters << (Monster.new("Familia feliz", 1, bad, Prize.new(4,1)))

      bad = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible.", 2, [TreasureKind::BOTHHANDS], [])
      monsters << (Monster.new("Roboggoth", 8, bad, Prize.new(2,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMETS], [])
      monsters << (Monster.new("El espía ciego", 4, bad, Prize.new(1,1)))

      bad = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
      monsters << (Monster.new("El Lenguas", 20, bad, Prize.new(1,1)))

      bad = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3, [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], [])
      monsters << (Monster.new("Bicéfalo", 20, bad, Prize.new(1,1)))

      masdediez = Array.new
      monsters.each do |mostro|
        if mostro.combatLevel > 10
          masdediez << mostro
        end
      end

      puts "Se muestran los monstruos con nivel de combate superior a 10: \n\n"

      masdediez.each do |mostro|
        puts mostro.to_s
      end

      pierdenivel = Array.new
      monsters.each do |mostro|
        if mostro.bc.death == false && mostro.bc.levels > 0 && mostro.bc.nVisibleTreasures <= 0 && mostro.bc.nHiddenTreasures <= 0 && mostro.bc.specificHiddenTreasures ==nil && mostro.bc.specificVisibleTreasures == nil
          pierdenivel << mostro
        end
      end

      puts "Se muestran los monstruos con mal rollo que haga perder un nivel o mas: \n\n"

      pierdenivel.each do |mostro|
        puts mostro.to_s
      end

      ganamasuno = Array.new
      monsters.each do |mostro|
        if mostro.prize.level > 1
          ganamasuno << mostro
        end
      end

      puts "Se muestran los monstruos que te hagan ganar mas de un nivel: \n\n"

      ganamasuno.each do |mostro|
        puts ganamasuno
      end

      pierdealgo = Array.new
      monsters.each do |mostro|
        if !mostro.bc.death
          if  mostro.bc.nVisibleTreasures > 0 || mostro.bc.nHiddenTreasures > 0 || mostro.bc.specificHiddenTreasures != nil || mostro.bc.specificVisibleTreasures != nil
            pierdealgo << mostro
          end
        end
      end

      puts "Se muestran los monstruos con los que se pierde un tesoro: \n\n"

      pierdealgo.each do |mostro|
        puts mostro
      end


    end
  end
end
