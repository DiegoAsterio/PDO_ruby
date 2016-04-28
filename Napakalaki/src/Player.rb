#encoding utf-8

module NapakalakiGame

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
      @dead = false
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
      nLevels = m.getLevelsGained
      incrementLevels(nLevels)
      nTreasures = m.getTreasuresGained
      if nTreasures > 0
        dealer = CardDealer.instance
        for i in 1..nTreasures
          treasure = dealer.nextTreasure
          @hiddenTreasures << treasure
        end
      end
    end

    def applyBadConsequence(m)
      badConsequence = m.badConsequence
      nLevels = badConsequence.levels
      decrementLevels(nLevels)
      pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)
    end

    def canMakeTreasureVisible(t)
      counter = howManyVisibleTreasures(t.type)

      if (counter < 2 && t.type == TreasureKind::ONEHAND)
        return true;
      elsif (counter < 1)
        return true;
      else
        return false;
      end
    end

    def howManyVisibleTreasures(tKind)
      n = 0
      @visibleTreasures.each do |tes|
        if tes.type == tKind
          n = n + 1
        end
      end
      return n
    end

    def dieIfNoTreasures
      if @hiddenTreasures.empty? && @visibleTreasures.empty?
        @dead = true
      end
    end

    public

    def initialize(name)
      @name = name
      @level = -1
      @dead = true
      @hiddenTreasures = Array.new()
      @visibleTreasures = Array.new()
      @pendingBadConsequence = nil
    end

    def to_s
      return @name + ", Nivel: " + @level.to_s
    end


    def isDead
      return @dead
    end

    def getHiddenTreasures
      @hiddenTreasures
    end

    def getVisibleTreasures
      @visibleTreasures
    end

    def combat(m)
      myLevel = getCombatLevel
      monsterLevel = m.combatLevel
      if myLevel > monsterLevel
        applyPrize(m)
        return CombatResult::WIN
      else
        applyBadConsequence(m)
        return CombatResult::LOSE
      end
    end

    def makeTreasureVisible(t)
      canI = canMakeTreasureVisible(t)
      if canI
        @visibleTreasures << t
        @hiddenTreasures.delete(t)
      end
    end

    def discardVisibleTreasure(t)
      @visibleTreasures.delete(t)
      CardDealer.instance.giveTreasureBack(t)
      if @pendingBadConsequence != nil && ! @pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractVisibleTreasures(t);
      end
      dieIfNoTreasures
    end

    def discardHiddenTreasure(t)
      @hiddenTreasures.delete(t)
      CardDealer.instance.giveTreasureBack(t)
      if @pendingBadConsequence != nil && ! @pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractHiddenTreasures(t);
      end
      dieIfNoTreasures
    end

    def validState
      if @pendingBadConsequence == nil || @pendingBadConsequence.isEmpty
        if @hiddenTreasures.size < 5
          return true
        end
      end
      return false
    end

    def initTreasures
      dealer = CardDealer.instance
      dice = Dice.instance
      bringToLife
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
      number = dice.nextNumber

      if number > 1
        @hiddenTreasures << dealer.nextTreasure
      end
      if number == 6
        @hiddenTreasures << dealer.nextTreasure
      end
    end

    def discardAllTreasures
      @visibleTreasures.each do |tre|
        discardVisibleTreasure(tre)
      end

      @hiddenTreasures.each do |tre|
        discardHiddenTreasure(tre)
      end
    end

  end
end
