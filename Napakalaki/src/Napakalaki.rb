#encoding utf-8

module Napakalaki

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

    @@instance = Napakalaki.new

    def initialize
      @currentPlayerIndex
      @currentPlayer
      @players = Array.new()
      @dealer
      @currentMonster
    end

    def initPlayers(names)

    end

    def nextPlayer

    end

    def nextTurnAllowed

    end

    public

    def self.instance
      @@instance
    end

    def developCombat

    end

    def discardVisibleTreasures(treasures)

    end

    def discardHiddenTreasures(treasures)

    end

    def makeTreasuresVisible(treasures)

    end

    def initGame(players)

    end

    def getCurrentPlayer

    end

    def getCurrentMonster

    end

    def nextTurn

    end

    def endOfGame(result)

    end

    private_class_method :new
  end
end
