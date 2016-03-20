#encoding utf-8
module Napakalaki
  require_relative 'Prize.rb'
  require_relative 'BadConsequence.rb'

  class Monster

    def initialize(aText,aLevel,aBadConsequence,aPrize)
      @name = aText
      @combatLevel = aLevel
      @bc = aBadConsequence
      @prize = aPrize
    end

    attr_reader :name
    attr_reader :combatLevel
    attr_reader :bc
    attr_reader :prize

    def to_s()
      str = "Nombre: #{@name} \n\t Nivel de combate: #{@combatLevel}\n"
      str = str + "\nConsecuencia:\n\t" + @bc.to_s
      str = str + "\nRecompensa:\n\t" + @prize.to_s + "\n\n\n"
    end

  end
end
