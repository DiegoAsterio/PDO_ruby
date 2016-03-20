#encoding utf-8
module Napakalaki

  class Prize

    def initialize(treasures, level)
      @treasures  = treasures
      @level = level
    end

    attr_reader :treasures
    attr_reader :level

    def to_s()
      "Tesoros ganados: #{@treasures} \t Niveles ganados: #{@level}"
    end

  end

end
