#encoding utf-8
module Napakalaki
  class BadConsequence
    DEAD = 0
    INV = -1

    def initialize(aText,someLevels,someVisibleTreasures,someHiddenTreasures,
      someSpecificVisibleTreasures,someSpecificHiddenTreasures,death)
      @text = aText
      @levels = someLevels
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
      @specificVisibleTreasures = someSpecificVisibleTreasures
      @specificHiddenTreasures = someSpecificHiddenTreasures
      @death = death
    end

    def self.newDeath(text)
      new(text,DEAD,DEAD,DEAD,nil,nil,true)
    end

    def self.newLevelNumberOfTreasures(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
      new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,nil,nil,false)
    end

    def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,
      someSpecificHiddenTreasures)
      new(aText,someLevels,INV,INV,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
    end

    #Test.instance_eval { undef :new }
    private_class_method :new

    attr_reader :text
    attr_reader :levels
    attr_reader :nVisibleTreasures
    attr_reader :nHiddenTreasures
    attr_reader :specificVisibleTreasures
    attr_reader :specificHiddenTreasures
    attr_reader :death

    def to_s()
      ret = "#{@text} "
      if @death == true
        ret = ret + "Estas muerto, no te preocupes sigues jugando."
      else
        ret = ret + " Pierdes #{@levels} niveles "
        if @specificVisibleTreasures != nil
          ret = ret + " lista de tesoros visibles perdidos: [#{@specificVisibleTreasures.join(",")}]"
        else
          ret = ret + " número de tesoros visibles perdidos: #{@nVisibleTreasures}"
        end
        if @specificHiddenTreasures != nil
          ret = ret + " lista de tesoros ocultos perdidos: [#{@specificHiddenTreasures.join(",")}]"
        else
          ret = ret + " número de tesoros ocultos perdidos: #{@nHiddenTreasures}"
        end
      end
      ret
    end
  end

end
