#encoding utf-8
module Napakalaki

class CardDealer
  require_relative 'Monster.rb'
  require_relative 'Treasure.rb'
  require_relative 'BadConsequence.rb'
  #require 'active_support'

  #cattr_reader :instance
  private

  def initialize
    @unusedMonsters = Array.new
    @usedMonsters = Array.new

    @unusedTreasures = Array.new
    @usedTreasures = Array.new
  end

  @@instance = CardDealer.new

  def initTreasureCardDeck
    #¡Sí, mi amo!
    @unusedTreasures << Treasure.new("¡Sí, mi amo!", 4, TreasureKind::HELMETS)

    #Botas de investigación
    @unusedTreasures << Treasure.new("Botas de investigación", 3, TreasureKind::SHOES)

    #Capucha de Cthulhu
    @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMETS)

    #A prueba de babas verdes
    @unusedTreasures << Treasure.new("A prueba de babas verdes", 2, TreasureKind::ARMOR)

    #Botas de lluvia  ́acida
    @unusedTreasures << Treasure.new("Botas de lluvia  ́acida",  1, TreasureKind::BOTHHANDS)

    #Casco minero
    @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMETS)

    #Ametralladora Thompson
    @unusedTreasures << Treasure.new("Ametralladora Thompson", 4, TreasureKind::BOTHHANDS)

    #Camiseta de la UGR
    @unusedTreasures << Treasure.new("Camiseta de la UGR", 1, TreasureKind::ARMOR)

    #Clavo de rail ferroviario
    @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)

    #Cuchillo de sushi arcano
    @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)

    #Fez Alópodo
    @unusedTreasures << Treasure.new("Fez Alópodo", 3, TreasureKind::HELMETS)

    #Hacha prehistórica
    @unusedTreasures << Treasure.new("Hacha prehistórica", 2, TreasureKind::ONEHAND)

    #El aparato del Pr. Tesla
    @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)

    #Gaita
    @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)

    #Insecticida
    @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)

    #Escopeta de 3 cañones
    @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)

    #Garabato místico
    @unusedTreasures << Treasure.new("Garabato místico", 2, TreasureKind::ONEHAND)

    #La rebeca metálica
    @unusedTreasures << Treasure.new("La rebeca metálica", 2, TreasureKind::ARMOR)

    #Lanzallamas
    @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)

    #Necronomicón
    @unusedTreasures << Treasure.new("Necronomicón", 5, TreasureKind::BOTHHANDS)

    #Linterna a 2 manos
    @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)

    #Necro-gnomicón
    @unusedTreasures << Treasure.new("Necro-gnomicón", 2, TreasureKind::ONEHAND)

    #Mazo de los antiguos
    @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)

    #Necroplayboycon
    @unusedTreasures << Treasure.new("Necroplayboycon", 3, TreasureKind::ONEHAND)

    #Necrotelecom
    @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMETS)


    #Porra preternatural
    @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)

    #Tentáculo de pega
    @unusedTreasures << Treasure.new("Tentáculo de pega", 2, TreasureKind::HELMETS)

    #Zapatillas deja-amigos
    @unusedTreasures << Treasure.new("Zapatillas deja-amigos", 1, TreasureKind::SHOES)

    #Shogulador
    @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)

    #Varita de atizamiento
    @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
  end

  def initMonsterCardDeck

     bad = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.", 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
     @unusedMonsters << (Monster.new("2 Byakhees de bonanza", 8, bad, Prize.new(2,1)))

     bad = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.", 0, [TreasureKind::HELMETS], [])
     @unusedMonsters << (Monster.new("Chibithulhu", 2, bad, Prize.new(1,1)))

     bad = BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso. Pierdes el calzado visible.", 0, [TreasureKind::SHOES], [])
     @unusedMonsters << (Monster.new("El sopor de Dunwich", 2, bad, Prize.new(1,1)))

     bad = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
     @unusedMonsters << (Monster.new("Ángeles de la noche ibicenca", 14, bad, Prize.new(4,1)))

     bad = BadConsequence.newLevelSpecificTreasures("Pierdes todos tus tesoros visibles.", 0, [TreasureKind::ARMOR, TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::SHOES, TreasureKind::HELMETS], [])
     @unusedMonsters << (Monster.new("El gorrón en el umbral", 10, bad, Prize.new(3,1)))

     bad = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.", 0, [TreasureKind::ARMOR], [])
     @unusedMonsters << (Monster.new("H.P. Munchcraft", 6, bad, Prize.new(2,1)))

     bad = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible.", 0, [TreasureKind::ARMOR], [])
     @unusedMonsters << (Monster.new("Bichgooth", 2, bad, Prize.new(1,1)))

     bad = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0)
     @unusedMonsters << (Monster.new("El rey de rosa", 13, bad, Prize.new(4,2)))

     bad = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
     @unusedMonsters << (Monster.new("La que redacta en las sombras", 3, bad, Prize.new(1,1)))

     bad = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
     @unusedMonsters << (Monster.new("Los hondos verdes", 7, bad, Prize.new(2,1)))

     bad = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2)
     @unusedMonsters << (Monster.new("Semillas Cthulhu", 4, bad, Prize.new(2,1)))

     bad = BadConsequence.newLevelSpecificTreasures("Te intentas escapar. Pierdes una mano visible.", 0, [TreasureKind::ONEHAND], [])
     @unusedMonsters << (Monster.new("Dameargo", 1, bad, Prize.new(2,1)))

     bad = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
     @unusedMonsters << (Monster.new("Pollipólipo volante", 3, bad, Prize.new(1,1)))

     bad = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estás muerto.")
     @unusedMonsters << (Monster.new("Yskhtihyssg-Goth", 12, bad, Prize.new(3,1)))

     bad = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
     @unusedMonsters << (Monster.new("Familia feliz", 1, bad, Prize.new(4,1)))

     bad = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible.", 2, [TreasureKind::BOTHHANDS], [])
     @unusedMonsters << (Monster.new("Roboggoth", 8, bad, Prize.new(2,1)))

     bad = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMETS], [])
     @unusedMonsters << (Monster.new("El espía ciego", 4, bad, Prize.new(1,1)))

     bad = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
     @unusedMonsters << (Monster.new("El Lenguas", 20, bad, Prize.new(1,1)))

     bad = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3, [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], [])
     @unusedMonsters << (Monster.new("Bicéfalo", 20, bad, Prize.new(1,1)))

  end

  def shuffleTreasures
    @unusedTreasures.shuffle!
  end

  def shuffleMonsters
    @unusedMonsters.shuffle!
  end

  public

  def self.instance
    @@instance
  end

  def nextTreasure
    t = @unusedTreasures.last
    @unusedTreasures.pop
    t
  end

  def nextMonster
    m = @unusedMonsters.last
    @unusedMonsters.pop
    m
  end

  def giveTreasureBack(t)
    @usedTreasures << t
  end

  def giveMonsterBack(m)
    @usedMonsters << m
  end

  def initCards
    initTreasureCardDeck
    initMonsterCardDeck
    shuffleTreasures
    shuffleMonsters
  end

  private_class_method :new
end

end
