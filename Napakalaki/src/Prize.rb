#encoding utf-8
module NapakalakiGame

  class Prize

    def initialize(treasures, level)
      @treasures  = treasures
      @level = level
      @treasures.freeze
      @level.freeze
    end

    def to_s
      return "Premio: Ganas #{@treasures} tesoros y  #{@level} niveles"
    end

    attr_reader :treasures
    attr_reader :level

  end

end
