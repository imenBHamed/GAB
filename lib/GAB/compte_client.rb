class CompteClient
  
	attr_reader :identifiant_client
	attr_reader :pwd_client
	attr_writer :pwd_client
	attr_reader :nom_client
        attr_reader :argent
	attr_writer :argent
	
	
	def initialize(identifiant_client, pwd_client, nom_client, argent)
	  @identifiant_client, @pwd_client, @nom_client, @argent = identifiant_client, pwd_client, nom_client, argent
	end
end 
