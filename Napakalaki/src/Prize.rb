#encoding utf-8
module Napakalaki

  class Prize

    def initialize(treasures, level)
      @treasures  = treasures
      @level = level
      @treasures.freeze
      @level.freeze
    end

    attr_reader :treasures
    attr_reader :level

  end

end
