require 'test_helper'
require 'GAB'

describe GAB do
  describe ".consulter" do
    
    describe "cas avec aucune compte a consulter" do
      it "retourne [] " do
        GAB.consulter( nil, nil,'bin/db.txt')
          .must_be_empty
      end
    end
    
    describe "exemple pour consulter le montant un client" do
      it "retourne le solde de client en question" do
        GAB.consulter( "alexis", "alexis1", 'bin/db.txt' )
          .must_equal "Votre compte contient:8001$"
      end
    end
    
      describe "cas avec inexistance d'un client" do
      it "retourne un message d'erreur qui affiche 'Identifiant ou mot de passe sont invalides'" do
        GAB.consulter( "alex", "alexis1", 'bin/db.txt' )
          .must_equal "Identifiant ou mot de passe sont invalides"
      end
    end
  end 
end