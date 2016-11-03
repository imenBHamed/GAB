  require 'test_helper'
  require 'GAB'
 
  describe GAB do
    describe ".retirer" do
      
      before do
	@clients= [CompteClient.new( "client1", "client1", "nomC", "10")]
      end
     
      describe "cas avec inexistance des arguments" do
       it "retourne [] " do
         
	 GAB.retirer( nil, nil, nil, @clients )
           .must_be_empty
       end
     end
         
     describe "cas avec inexistance d'un client" do            
       it "retourne nil " do
         
	 GAB.retirer( "ales", "alexis","210", @clients )
           .must_equal nil
       end
     end   
      
     describe "cas avec avec depassement de seuil" do
       it "retourne nil " do
         
	 GAB.retirer( "client1", "client1", "5632", @clients)
           .must_equal nil
       end
     end
     
     describe "exemple de retirer d'argent" do
       it "retourne le montant reste " do
         
	 GAB.retirer( "client1", "client1", "5", @clients)
           .must_equal 5
       end
     end
   end
 end 
