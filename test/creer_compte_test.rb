  require 'test_helper'
  require 'GAB'
  
  describe GAB do
    describe ".creer" do    
      
 
      let(:cl1) { CompteClient.new( "client1", "pwd1", "nomC","10" ) }
      let(:cl2) { CompteClient.new( "client2", "pwd2", "nomA", "102" ) }
      let(:cl3) { CompteClient.new( "client3", "pwd3", "clientB", "0" ) }

      before do
      @collection_client = [cl1, cl2]
      end
      
      describe "cas avec aucun compte a consulter" do 
	it "retourne [] " do
         
	  GAB.creer( nil, nil, nil,nil, nil, @collection_client )
           .must_be_empty
        end
      end
            
      describe "cas avec administrateur invalides" do
       it "rien a retourner " do
	 
	 GAB.creer( "client3", "pwd3", "clientB", "client11", "pwd1", @collection_client )
            .must_equal nil
       end
     end
     
      describe "cas avec client deja existe dans la base de donnees" do
	it "rien a retourner " do
          
	  GAB.creer( "client2", "pwd2", "nomA", "client1", "pwd1", @collection_client )
           .must_equal nil
	end
     end
         
     describe "exemple de creation d'un nouveau client dans la base de donnees" do
       it "le compte a cree " do   
	 @collection_client_apres = [cl1,cl2,cl3]
	
	 GAB.creer( "client3", "pwd3", "clientB", "client1", "pwd1", @collection_client )      
	 .must_equal  @collection_client_apres
         end
       end
    end 
 end 
