  require 'test_helper'
  require 'GAB'
  
  describe GAB do
    describe ".consulter" do    
 
      before { 
      @f= [CompteClient.new("client1","client1","nomC","10")]
 
    }
      describe "cas avec aucune compte a consulter" do
        it "retourne [] " do
         GAB.consulter( nil, nil,@f)
           .must_be_empty
        end
      end
 
       describe "exemple pour consulter le montant un client" do
       it "retourne le solde de client en question" do
         GAB.consulter( "client1", "client1", @f )
           .must_equal "Votre compte contient:10$"
       end
     end
    end 
 end