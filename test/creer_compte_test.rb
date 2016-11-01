require 'test_helper'
require 'GAB' 

describe GAB do
  describe ".creer" do
     
    before { 
      @f= "fichier"
 
    }
   
    describe "cas avec aucune compte a creer" do
      it "retourne [] " do
        GAB.creer( nil, nil,nil, nil,nil, @f)
          .must_be_empty
      end
    end
    
     describe "cas avec administrateur invalides" do
       it "retourne un message d'erreur contenant'Vous n'avez pas l''autorisation d''ajouter un nouveau compte' " do
 	 GAB.creer("a000", "a001","a005","admin","admin",@f)
            .must_equal "Vous n'avez pas l''autorisation d''ajouter un nouveau compte" 
       end
     end
#     
#      describe "cas avec client deja existe dans la base de donnees" do
#       it "retourne un message d'erreur contenant'Utilisateur deja existe dans la base de donnees' " do
#         GAB.creer("alexis_bush", "alexis","alexis1","admin","admin",'bin/db.txt')
#           .must_equal "Utilisateur deja existe dans la base de donnees"
#       end
#     end
#     
#     describe "exemple de creation d'un nouveau client dans la base de donnees" do
#       it "retourne un message d'erreur contenant'Utilisateur deja existe dans la base de donnees' " do
#                    @ffile = [CompteClient.new("client1", "pwd1", "clientA","0"),CompteClient.new("client2", "pwd2", "clientB","0"),CompteClient.new("alex", "alex21","alesx21_lio","0")]

#         GAB.creer("normand", "normand1","normand_lio","admin","admin",'bin/db.txt')
#           .must_equal "Votre compte a ete enregistre avec succes dans la base de donnees"
#       end
#     end
    
  end
end
