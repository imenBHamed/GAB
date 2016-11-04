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
	
	def == (client)
	  return  self.identifiant_client == client.identifiant_client && self.pwd_client == client.pwd_client && self.nom_client == client.nom_client && self.argent == client.argent
	 end
	  
end 
