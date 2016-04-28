module MAIN
  require_relative 'BadConsequence.rb'

  b = NapakalakiGame::BadConsequence.newDeath("Tio la patata no se puede poseer.")

  puts b.text
end
