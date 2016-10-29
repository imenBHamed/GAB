require 'test_helper'
require 'GAB'

describe GAB do
  describe ".deposer" do
    
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
     describe "cas avec montant invalid" do
      it "retourne un message d'erreur contenant 'montant insuffisant' " do
        GAB.deposer( "alexis", "alexis1",'bin/db.txt',"-5632")
          .must_equal "montant insuffisant"
      end
    end
    
    describe "exemple de deposer d'argent" do
      it "retourne un message d'erreur contenant 'depot effectuee avec succes' " do
        GAB.deposer( "jeny", "jeny1",'bin/db.txt',"1")
          .must_equal "Depot effectue avec succes"
      end
    end
  end
end
