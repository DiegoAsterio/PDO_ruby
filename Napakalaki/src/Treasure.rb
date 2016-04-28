#encoding utf-8

module NapakalakiGame
  require_relative 'TreasureKind.rb'

  class Treasure
    def initialize(n,bonus,t)
      @name = n
      @bonus = bonus
      @type = t
    end

    attr_reader :name, :bonus, :type

    def to_s
      return "Tesoro: \n" + @name + " sube #{@bonus} niveles y es del tipo #{@type}"
    end

  end
end
