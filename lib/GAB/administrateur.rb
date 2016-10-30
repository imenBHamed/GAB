class Administrateur
  
	attr_reader :identifiant_admin
	attr_reader :pwd_admin
	
	
	
	def initialize (identifiant_admin, pwd_admin)
	  @identifiant_admin, @pwd_admin=identifiant_admin, pwd_admin
	end
end 