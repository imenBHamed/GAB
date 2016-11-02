  require 'test_helper'
  require 'GAB'
  
  describe GAB do
    describe ".consulter" do    
 
      before do
      @clients= [CompteClient.new("client1", "client1", "nomC", "10")]
      end
                 
      describe "cas avec aucune compte a consulter" do
        it "retourne [] " do
         
	  GAB.consulter( nil, nil,@clients)
           .must_be_empty
        end
      end
      
      describe "cas avec inexistance d'un client" do
	it "retourne un message d'erreur qui affiche 'Identifiant ou mot de passe sont invalides'" do
	 
	  GAB.consulter( "alex", "alexis1", @clients )  
	  .must_equal "Identifiant ou mot de passe sont invalides"
	end	
	
      end
       describe "exemple pour consulter le montant un client" do
       it "retourne le solde de client en question" do
         
	 GAB.consulter( "client1", "client1", @clients )
           .must_equal "Votre compte contient:10$"
       end
     end
    end 
 end