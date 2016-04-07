#encoding utf-8

module Napakalaki

  require_relative 'CombatResult.rb'
  require_relative 'CardDealer.rb'
  require_relative 'Treasure.rb'
  require_relative 'Dice.rb'
  require_relative 'BadConsequence.rb'


  class Player
    MAXLEVEL = 10
    attr_reader :level, :name
    private


    def bringToLife
      @level = 1

      n = Dice.instance.nextNumber()
      if n == 1
        @hiddenTreasures << CardDealer.instance.nextTreasure
      elsif n == 6
        for i in 1..3
          @hiddenTreasures << CardDealer.instance.nextTreasure
        end
      else
        for i in 1..2
          @hiddenTreasures << CardDealer.instance.nextTreasure
        end
      end

    end

    def getCombatLevel
      ret = @level
      @visibleTreasures.each do |tes|
        ret = ret + tes.bonus
      end
      return ret
    end

    def incrementLevels(l)
      @level += l
    end

    def decrementLevels(l)
      @level -= l
      if @level < 1
        @level = 1
      end
    end

    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end

    def applyPrize(m)

    end

    def applyBadConsequence(m)

    end

    def canMakeTreasureVisible(t)

    end

    def howManyVisibleTreasures(tKind)
      n = 0
      @visibleTreasures.each do |tes|
        if tes.type.eql? tKind
          ++n
        end
      end
      n
    end

    def dieIfNoTreasures
      @hiddenTreasures.clear
      @visibleTreasures.clear
    end

    public

    def initialize(name)
      @name = name
      @level = -1
      @dead = false
      @hiddenTreasures = Array.new()
      @visibleTreasures = Array.new()
      @pendingBadConsequence
      bringToLife
    end


    def isDead
      return @dead
    end

    def getHiddenTreasures

    end

    def getVisibleTreasures

    end

    def combat(m)

    end

    def makeTreasuresVisible(t)

    end

    def discardVisibleTreasure

    end

    def discardHiddenTreasure

    end

    def validState
      ret = false
      if @pendingBadConsequence.isEmpty && hiddenTreasures.size < 4
        ret = true
      end
      ret
    end

    def initTreasures

    end

  end
end
