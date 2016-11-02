 require 'test_helper'
 require 'GAB'
 
 describe GAB do
   describe ".deposer" do
      
     before do
        
      @clients= [CompteClient.new( "client", "client1", "nomC", "10")]     
     end
     
     describe "cas avec inexistance des arguments" do
       it "retourne [] " do
         GAB.deposer( nil, nil, nil, @clients)
           .must_be_empty
       end
     end 
     
     describe "cas avec inexistance d'un client" do       
       it "retourne nil " do

	 GAB.deposer( "ales", "alexis","210", @clients)
	 .must_equal nil
       end
     end  
     
     describe "cas avec montant invalide" do
       it "retourne nil" do
  
        GAB.deposer( "client", "client1","-5632", @clients)	
	.must_equal nil
       end
     end  
     
     describe "exemple de deposer d''argent" do
       it "retourne le montant final apres le depot " do

	 GAB.deposer( "client", "client1", "10", @clients)
           .must_equal  20
       end
     end
  
   end
 end
 
