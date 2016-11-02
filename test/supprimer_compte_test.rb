 require 'test_helper'
 require 'GAB' 
 
 describe GAB do
   describe ".supprimer" do
     
        
     let(:cl1) { CompteClient.new("client1","pwd1","nomC","10") }
     let(:cl2) { CompteClient.new("client2","pwd2","nomA","102") }
     let(:cl3) { CompteClient.new("client3", "pwd3", "clientB","0") }

      before do
      @collection_client = [cl1, cl2, cl3]
      end
     
     describe "cas avec aucun compte a supprimer" do
       it "retourne [] " do
         GAB.supprimer( nil, nil, nil, @collection_client )
           .must_be_empty
       end
     end  
      
     describe "cas avec administrateur invalides" do
       it "retourne nil" do
	 
	 GAB.supprimer( "client3", "client11", "pwd1", @collection_client )
            .must_equal nil
       end
     end
           
     describe "cas avec client n''existe pas dans la base de donnees" do
	it "retourne nil " do
          
	  GAB.supprimer( "client10", "client1", "pwd1", @collection_client )
           .must_equal nil
	end
     end
     
          
     describe "exemple d''une suppression d''un client de la base de donnees" do
	it "retourne nil " do
          @collection_client_apres = [cl1, cl3]
	  
	  GAB.supprimer( "client2", "client1", "pwd1", @collection_client )
           .must_equal  @collection_client_apres
	end
     end
     
   end
 end  
 
