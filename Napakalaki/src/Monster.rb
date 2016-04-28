#encoding utf-8
module NapakalakiGame
  require_relative 'Prize.rb'
  require_relative 'BadConsequence.rb'

  class Monster

    def initialize(aText,aLevel,aBadConsequence,aPrize)
      @name = aText
      @combatLevel = aLevel
      @badConsequence = aBadConsequence
      @prize = aPrize
    end

    def getLevelsGained
      @prize.level
    end

    def getTreasuresGained
      @prize.treasures
    end

    attr_reader :name, :combatLevel, :badConsequence, :prize

    def to_s
      str = "Nombre: #{@name} \t Nivel de combate: #{@combatLevel}\n"
      str = str + "\nConsecuencia:\n\t" + @badConsequence.to_s
      str = str + "\nRecompensa:\n\t" + @prize.to_s + "\n\n\n"
    end

  end
end
