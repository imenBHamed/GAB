 require 'test_helper'
 require 'GAB' 
 
 describe GAB do
   describe ".modifier" do
     
        
     let(:cl1) { CompteClient.new("client1","pwd1","nomC","10") }
     let(:cl2) { CompteClient.new("client2","pwd2","nomA","102") }
     let(:cl3) { CompteClient.new("client3", "pwd3", "clientB","0") }
     let(:cl22) { CompteClient.new("client2", "pwd22", "nomA","102") }

      before do
      @collection_client = [cl1, cl2, cl3]
      end
     
     describe "cas avec aucun compte a modifier" do
       it "retourne [] " do
         GAB.modifier( nil, nil, nil, @collection_client )
           .must_be_empty
       end
     end   
     
         
     describe "cas avec client n''existe pas dans la base de donnees" do
       it "retourne nil " do
          
	  GAB.modifier( "client2", "pwd25", "pwd10", @collection_client )
           .must_equal nil
	end
     end
           
     describe "exemple d''une modification du mot de passe d''un client" do	
       it "retourne la collection de client apres la modification" do  
	 @client_apres = [cl1, cl22, cl3]
  
	 GAB.modifier( "client2", "pwd2", "pwd22", @collection_client )
           .must_equal  @client_apres
       end
     end
   end
 end
 
