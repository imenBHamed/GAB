module Transaction
   require_relative 'crud_client'
   
   SEUIL_MAX= -101
       
    class Compte
      
      def self.ouvrir( db_file )
	 @depot= CrudClient
         @comptes = @depot.lire( db_file )	
	 @fichier = db_file
      end        
      
      def self.rechercher( identifiant, pwd )
	 @comptes.find{|compte| compte.identifiant_client == identifiant && compte.pwd_client == pwd }
      end
      
      def self.ajouter_client( client )
	 @comptes <<  client
      end     
      
      def self.supprimer_client( client )
	@comptes.delete( client )
      end
      
      def self.position_client( mot_a_rechercher)
	 @comptes.index {|client| client.pwd_client == mot_a_rechercher }
      end 
      
      def self.modifier_client( ancien_pwd, nouveau_pwd )	
 	position = position_client( ancien_pwd )  
	@comptes[position].pwd_client = nouveau_pwd
	 
      end      
      
      def self.retirer_argent( pwd_client, montant )
	position = position_client( pwd_client )  
	
	if  @comptes[position].argent.to_i > SEUIL_MAX then    
	  nouveauArgent= @comptes[position].argent.to_i - montant.to_i
	  if nouveauArgent > SEUIL_MAX then
	    @comptes[position].argent = nouveauArgent
	    "operation effectuee avec succes" 
	  else   
	    "Desole,vous n''avez pas d'argent" 
	  end
	end
      end
      
      
      def self.deposer_argent( pwd_client, montant)
	position = position_client( pwd_client )        
	ancien_montant = @comptes[position].argent.to_i    
	nouveau_montant = ancien_montant + montant.to_i          
	@comptes[position].argent = nouveau_montant
      end
      
      
      def self.deconnecter()
       @depot.enregistrer(@fichier, @comptes)
      end
      
  
   end
end