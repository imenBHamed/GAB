require 'test_helper'
require 'GAB'

describe GAB do
  describe ".creer" do
    
    describe "cas avec inexistance des arguments" do
      it "retourne [] " do
        GAB.deposer( nil, nil,'bin/db.txt',nil)
          .must_be_empty
      end
    end
    
    describe "cas avec inexistance d'un client" do
      it "retourne un message d'erreur contenant 'Identifiant ou mot de passe sont invalides' " do
        GAB.deposer( "ales", "alexis",'bin/db.txt',"210")
          .must_equal "Identifiant ou mot de passe sont invalides"
      end
    end
    
  end
end
