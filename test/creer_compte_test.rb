  require 'test_helper'
  require 'GAB'
  
  describe GAB do
    describe ".creer" do    
      
        let(:cl1) { CompteClient.new("client1","client1","nomC","10") }
	let(:cl2) { CompteClient.new("client2", "pwd2", "clientB","0") }


      before do
      @collection_clients= [cl1]
     
      end
      describe "cas avec aucune compte a consulter" do
        it "retourne [] " do
         GAB.creer( nil, nil, nil,nil, nil, @collection_clients)
           .must_be_empty
        end
      end
 
        describe "exemple de creation d'un nouveau client dans la base de donnees" do
        it "le compte a cree " do 
	   @clients_apres = [cl1, cl2]
          GAB.creer( "client2", "pwd2", "clientB", "client1", "client1", @collection_clients )
            .must_equal  @clients_apres
        end
      end
    end 
 end 
