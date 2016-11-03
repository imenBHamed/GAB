gem 'minitest', '>5.4.3'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'

class Object
  def _describe( test )
    puts "--- On saute les tests pour \"#{test}\" ---"
  end

  def _it( test )
    puts "--- On saute le test \"#{test}\" ---"
  end
end


def avec_fichier( nom_fichier, contenu )
  # On cree le fichier.
  File.open( nom_fichier, "w" ) do |fich|
    contenu.each do |ligne|
      fich.puts  ligne
    end
  end

  # On execute le bloc.
  yield

  # On supprime le fichier.
  FileUtils.rm_f nom_fichier
end

def gab( cmd )
  # On execute la commande indiquee et on retourne un Array des lignes
  # obtenues.
  %x{bundle exec bin/GAB #{cmd}}.split("\n")
end

def contenu_fichier( nom_fichier )
  IO.readlines(nom_fichier).map(&:chomp)
end
