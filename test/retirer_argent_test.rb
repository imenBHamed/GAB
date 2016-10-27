 require 'test_helper'
require 'GAB'

describe GAB do
  describe ".retirer" do
    
    describe "cas avec inexistance des arguments" do
      it "retourne [] " do
        GAB.retirer( nil, nil,'bin/db.txt',nil)
          .must_be_empty
      end
    end
    
    describe "cas avec inexistance d'un client" do
      it "retourne un message d'erreur contenant 'Identifiant ou mot de passe sont invalides' " do
        GAB.retirer( "ales", "alexis",'bin/db.txt',"210")
          .must_equal "Identifiant ou mot de passe sont invalides"
      end
    end
    
     describe "cas avec montant invalid" do
      it "retourne un message d'erreur contenant 'montant insuffisant' " do
        GAB.retirer( "alexis", "alexis1",'bin/db.txt',"-5632")
          .must_equal "montant insuffisant"
      end
    end
    
    describe "exemple de retirer d'argent" do
      it "retourne un message d'erreur contenant 'operation effectuee avec succes' " do
        GAB.retirer( "jeny", "jeny1",'bin/db.txt',"10")
          .must_equal "operation effectuee avec succes"
      end
    end
    
    describe "cas avec deppasemenr de seuil" do
      it "retourne un message d'erreur contenant 'operation effectuee avec succes' " do
        GAB.retirer( "marwakh", "marwakh1",'bin/db.txt',"952906")
          .must_equal "Desole,vous n''avez pas d'argent"
      end
    end
  end
end
