#encoding utf-8
module NapakalakiGame

  require_relative 'Player.rb'
  require_relative 'TreasureKind.rb'

  class BadConsequence

    MAXTREASURES = 10

    def initialize(aText,someLevels,someVisibleTreasures,someHiddenTreasures,
      someSpecificVisibleTreasures,someSpecificHiddenTreasures)
      @text = aText
      @levels = someLevels
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
      @specificVisibleTreasures = someSpecificVisibleTreasures
      @specificHiddenTreasures = someSpecificHiddenTreasures
    end

    protected
    attr_writer :specificHiddenTreasures, :specificVisibleTreasures

    public

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
      new(aText,someLevels,MAXTREASURES,MAXTREASURES,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
    end

    #Test.instance_eval { undef :new }
    private_class_method :new

    attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :specificVisibleTreasures, :specificHiddenTreasures

    def substractVisibleTreasures(t)
      @specificVisibleTreasures = @specificVisibleTreasures.select{|tre| tre != t.type}
      @nVisibleTreasures = @specificVisibleTreasures.size
    end

    def substractHiddenTreasures(t)
      @specificHiddenTreasures = @specificHiddenTreasures.select{|tre| tre != t.type}
      @nHiddenTreasures = @specificHiddenTreasures.size
    end

    def adjustToFitTreasureLists(v, h)
      if ! @specificHiddenTreasures.empty? && ! @specificVisibleTreasures.empty?
        auxV = Array.new(@specificVisibleTreasures)
        auxVV = Array.new
        v.each{|vis| if auxV.count(vis.type) > 0
          auxVV << vis.type
          auxV.delete_at(auxV.index(vis.type))
        end
        }
        auxH = Array.new(@specificHiddenTreasures)
        auxHH = Array.new
        h.each{|hid| if auxH.count(hid.type) > 0
          auxHH << hid.type
          auxH.delete_at(auxH.index(hid.type))
        end
        }
        return BadConsequence.newLevelSpecificTreasures(@text,@levels,auxVV,auxHH)
      else
        return BadConsequence.newLevelNumberOfTreasures(@text,@levels,[@nVisibleTreasures,v.size].min,[@nHiddenTreasures,h.size].min)
      end
    end

    def to_s
      ret = @text
      if @levels == Player::MAXLEVEL && isEmpty
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
