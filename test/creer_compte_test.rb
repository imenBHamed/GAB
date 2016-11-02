  require 'test_helper'
  require 'GAB'
  
  describe GAB do
    describe ".creer" do    
      
        let(:cl1) { CompteClient.new("client1","pwd1","nomC","10") }
	let(:cl2) { CompteClient.new("client2","pwd2","nomA","102") }
	let(:cl3) { CompteClient.new("client3", "pwd3", "clientB","0") }


      before do
      @collection_clients= [cl1, cl2]
      end
      
      describe "cas avec aucune compte a consulter" do 
	it "retourne [] " do
         
	  GAB.creer( nil, nil, nil,nil, nil, @collection_clients)
           .must_be_empty
        end
      end
      
           
      describe "cas avec administrateur invalides" do
       it "retourne un message d'erreur contenant'Vous n'avez pas l''autorisation d''ajouter un nouveau compte' " do
	 
	 GAB.creer("client3", "pwd3", "clientB","client11","pwd1",@collection_clients)
            .must_equal nil
       end
     end
      describe "cas avec client deja existe dans la base de donnees" do
	it "retourne la collection de clients initiale " do
         
	  GAB.creer("client2","pwd2","nomA","client1","pwd1",@collection_clients)
           .must_equal nil
	end
     end
      
      
         
     describe "exemple de creation d'un nouveau client dans la base de donnees" do
       it "le compte a cree " do   
	 @clients_apres = [cl1, cl2, cl3]  
	
	 GAB.creer( "client2", "pwd2", "clientB", "client1", "client1", @collection_clients )      
	 .must_equal  @clients_apres
         end
       end
    end 
 end 
