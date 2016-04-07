#encoding utf-8
module Napakalaki

  require_relative 'Player.rb'
  require_relative 'TreasureKind.rb'

  class BadConsequence
    MAXTREASURES = 0
    INV = -1

    def initialize(aText,someLevels,someVisibleTreasures,someHiddenTreasures,
      someSpecificVisibleTreasures,someSpecificHiddenTreasures)
      @text = aText
      @levels = someLevels
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
      @specificVisibleTreasures = someSpecificVisibleTreasures
      @specificHiddenTreasures = someSpecificHiddenTreasures
    end

    def isEmpty
      return @nVisibleTreasures == MAXTREASURES && @nHiddenTreasures == MAXTREASURES && @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?
    end

    def self.newDeath(text)
      new(text,Player::MAXLEVEL,MAXTREASURES,MAXTREASURES,Array.new,Array.new)
    end

    def self.newLevelNumberOfTreasures(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
      new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,Array.new,Array.new)
    end

    def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,
      someSpecificHiddenTreasures)
      new(aText,someLevels,INV,INV,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
    end

    #Test.instance_eval { undef :new }
    private_class_method :new

    attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :specificVisibleTreasures, :specificHiddenTreasures

    def substractVisibleTreasures

    end

    def substractHiddenTreasures

    end

    def adjustToFitTreasureLists(v, h)

    end
  end

end
