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
 
    end 
 end