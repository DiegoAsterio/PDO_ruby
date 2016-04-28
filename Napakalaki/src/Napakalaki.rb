#encoding utf-8

module NapakalakiGame

  require_relative 'Monster.rb'
  require_relative 'CombatResult.rb'
  require_relative 'Player.rb'
  require_relative 'CardDealer.rb'
  require_relative 'Treasure.rb'
  #require 'active_support' #USEFUL GEM

  class Napakalaki
    #include Singleton #//I could definitely use this but I prefer learning it
                       #//the hard way

    #cattr_reader :instance #FROM A QUITE USEFUL GEM BUT IT IS NOT INSTALLED BY DEFAULT

    private

    INV = -1



    def initialize
      @currentPlayerIndex = INV
      @currentPlayer = nil
      @players = Array.new()
      @dealer = CardDealer.instance
      @currentMonster = nil
    end

    @@instance = Napakalaki.new

    def initPlayers(names)
      names.each do |name|
        @players << Player.new(name)
      end
    end

    def nextPlayer
      if @currentPlayerIndex == INV
        @currentPlayerIndex = rand(@players.length)
      else
        @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.length
      end
      return @players.at(@currentPlayerIndex);
    end

    def nextTurnAllowed
      if @currentPlayer != nil
        return @currentPlayer.validState
      else
        return true
      end
    end

    public

    def self.instance
      @@instance
    end

    def developCombat
      @currentPlayer.combat(@currentMonster)
    end

    def discardVisibleTreasures(treasures)
      treasures.each do |tre|
        @currentPlayer.discardVisibleTreasure(tre)
      end
    end

    def discardHiddenTreasures(treasures)
      treasures.each do |tre|
        @currentPlayer.discardHiddenTreasure(tre)
      end
    end

    def makeTreasuresVisible(treasures)
      treasures.each do |tre|
        @currentPlayer.makeTreasureVisible(tre)
      end
    end

    def initGame(players)
      initPlayers(players)
      @dealer.initCards
      nextTurn
    end

    def getCurrentPlayer
      @currentPlayer
    end

    def getCurrentMonster
      @currentMonster
    end

    def nextTurn
      stateOK = nextTurnAllowed;
      if stateOK
        @currentMonster = @dealer.nextMonster
        @currentPlayer = nextPlayer
        dead = @currentPlayer.isDead
        if dead
          @currentPlayer.initTreasures
        end
      end
      return stateOK
    end

    def endOfGame(result)
      return result == CombatResult::WINGAME
    end

    private_class_method :new
  end
end
