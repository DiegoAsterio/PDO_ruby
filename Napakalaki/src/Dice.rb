#encoding utf-8
module NapakalakiGame
  #require 'active_support'
  class Dice
    #cattr_reader :instance
    private

    def initialize

    end

    @@instance = Dice.new

    public

    def self.instance
      @@instance
    end

    def nextNumber
      rand(6)+1
    end

  end
end
