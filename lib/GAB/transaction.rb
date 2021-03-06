module Transaction
   require_relative 'crud_client'
   
   SEUIL_MAX= -101
       
    class TransactionCompte
      
      def self.ouvrir( db_file )
	 @fichier = db_file 
	 @depot= CrudClient
         @comptes = @depot.lire( db_file )	
	
      end        
      
      def self.rechercher( clients, identifiant, pwd )
	
 	@comptes= clients
	 
	@comptes.find{|compte| compte.identifiant_client == identifiant && compte.pwd_client == pwd }
      end
      
      def self.rechercher_client_par_identifiant( identifiant )
	
	 @comptes.find{|compte| compte.identifiant_client == identifiant }
      end
          
      def self.ajouter_client( identifiant_client, pwd_client ,nom_client )
	 @comptes <<  CompteClient.new( identifiant_client, pwd_client ,nom_client, "0" )
      end     
      
      def self.supprimer_client( identifiant_client )
	
	client = rechercher_client_par_identifiant( identifiant_client ) 
	
	if !client.nil? then  
	  @comptes.delete( client )
	  return @comptes
	end 
      end
      
      def self.position_client( mot_a_rechercher)
	 @comptes.index {|client| client.pwd_client == mot_a_rechercher }
      end 
      
      def self.modifier_client( ancien_pwd, nouveau_pwd )	
 	position = position_client( ancien_pwd )  
	@comptes[position].pwd_client = nouveau_pwd
	@comptes
      end      
      
      def self.retirer_argent( pwd_client, montant )
	
	position = position_client( pwd_client )  
	
	if  @comptes[position].argent.to_i > SEUIL_MAX then    
	  nouveauArgent= @comptes[position].argent.to_i - montant.to_i
	  if nouveauArgent > SEUIL_MAX then
	    @comptes[position].argent = nouveauArgent
	  end 
	end
      end
          
      def self.deposer_argent( pwd_client, montant)
	position = position_client( pwd_client )        
	ancien_montant = @comptes[position].argent.to_i    
	nouveau_montant = ancien_montant + montant.to_i          
	@comptes[position].argent = nouveau_montant
      end
      
      def self.sauvegarder()
       @depot.enregistrer(@fichier, @comptes)
      end
     
    end
end