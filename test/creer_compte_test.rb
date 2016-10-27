require 'test_helper'
require 'GAB' 

describe GAB do
  describe ".creer" do
    
    describe "cas avec aucune compte a creer" do
      it "retourne [] " do
        GAB.creer( nil, nil,nil, nil,nil, 'bin/db.txt')
          .must_be_empty
      end
    end
    
    describe "cas avec administrateur invalides" do
      it "retourne un message d'erreur contenant'Vous n'avez pas l''autorisation d''ajouter un nouveau compte' " do
        GAB.creer("alex", "alex21","alesx21_lio","admin","admin1",'bin/db.txt')
          .must_equal "Vous n'avez pas l''autorisation d''ajouter un nouveau compte"
      end
    end
    
     describe "cas avec client deja existe dans la base de donnees" do
      it "retourne un message d'erreur contenant'Utilisateur deja existe dans la base de donnees' " do
        GAB.creer("alexis", "alexis1","alexis_bush","admin","admin1",'bin/db.txt')
          .must_equal "Vous n'avez pas l''autorisation d''ajouter un nouveau compte"
      end
    end
    
  end
end
