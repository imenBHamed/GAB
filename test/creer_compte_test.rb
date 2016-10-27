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
        GAB.creer("alexis_bush", "alexis","alexis1","admin","admin",'bin/db.txt')
          .must_equal "Utilisateur deja existe dans la base de donnees"
      end
    end
    
    describe "exemple de creation d'un nouveau client dans la base de donnees" do
      it "retourne un message d'erreur contenant'Utilisateur deja existe dans la base de donnees' " do
        GAB.creer("normand", "normand1","normand_lio","admin","admin",'bin/db.txt')
          .must_equal "Votre compte a ete enregistre avec succes dans la base de donnees"
      end
    end
    
  end
end
