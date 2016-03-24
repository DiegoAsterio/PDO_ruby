module Napakalaki
require_relative 'Monster.rb'
require_relative 'Prize.rb'
require_relative 'TreasureKind.rb'
require_relative 'BadConsequence.rb'
module M2

  class Statistics
    def self.compute(monsters)
      mayornivel = Array.new
      maximo = monsters.first.combatLevel
      fuerte = monsters.first
      monsters.each do |mostro|
        if mostro.combatLevel > maximo
          fuerte = mostro
        end
      end

      puts "El monstruo mas fuerte es: " + fuerte.name

      acumulador = 0

      monsters.each do |mostro|
        acumulador += mostro.combatLevel
      end

      media = acumulador / monsters.size

      puts "La media de niveles es #{media} "

      pierdealgo = Array.new
      monsters.each do |mostro|
        if !mostro.bc.death
          if   mostro.bc.nHiddenTreasures > 0 || mostro.bc.specificHiddenTreasures != nil
            pierdealgo << mostro
          end
        end
      end

      puts "Se muestran los monstruos con los que se pierde un tesoro oculto: \n\n"

      pierdealgo.each do |mostro|
        puts mostro
      end

      pierdearmadura = Array.new
      monsters.each do |mostro|
        if !mostro.bc.death
          if   mostro.bc.specificVisibleTreasures.join. || mostro.bc.specificHiddenTreasures != nil
            pierdearmadura << mostro
          end
        end
      end

      puts "Se muestran los monstruos con los que se pierde un tesoro oculto: \n\n"

      pierdearmadura.each do |mostro|
        puts mostro
      end


    end
  end
end


end
