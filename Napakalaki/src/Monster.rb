#encoding utf-8
module Napakalaki
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

  end
end
