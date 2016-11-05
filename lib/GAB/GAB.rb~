module GAB
  
   def self.consulter(identifiant_client, pwd_client, clients ) 
     return [] if identifiant_client== nil || pwd_client==nil
       
     client= Transaction::TransactionCompte.rechercher( clients, identifiant_client, pwd_client)
     
      if !client.nil? then 
         "Votre compte contient:#{client.argent}$"
      else
        "Identifiant ou mot de passe sont invalides"
      end
   end
  
  
  def self.creer(identifiant_client, pwd_client, nom_client, identifiant_admin, pwd_admin, clients)
    return [] if identifiant_client== nil || pwd_client==nil|| nom_client==nil|| pwd_admin==nil || identifiant_admin==nil
           
     administrateur= Transaction::TransactionCompte.rechercher( clients, identifiant_admin, pwd_admin)
         
     client= Transaction::TransactionCompte.rechercher( clients, identifiant_client, pwd_client)
     
     if !administrateur.nil? then 
        if client.nil? then
	
 	 resultat= Transaction::TransactionCompte.ajouter_client( identifiant_client, pwd_client , nom_client )
       
        end
     end
    resultat
  end
  
  
   def self.supprimer(identifiant_client, identifiant_admin,pwd_admin,clients)
     return [] if identifiant_client== nil || identifiant_admin==nil ||pwd_admin == nil
 
     administrateur= Transaction::TransactionCompte.rechercher( clients, identifiant_admin, pwd_admin)

     if !administrateur.nil? then
       
 	Transaction::TransactionCompte.supprimer_client(identifiant_client)
       
     end
   end
   
   
   def self.modifier( identifiant_client, pwd_client, nouveau_pwd_client, clients )
        return [] if identifiant_client== nil || pwd_client==nil ||nouveau_pwd_client == nil
 
         client= Transaction::TransactionCompte.rechercher( clients, identifiant_client, pwd_client)
     
     if !client.nil? then
       
          Transaction::TransactionCompte.modifier_client( client.pwd_client, nouveau_pwd_client )

     end
   end 
   
   
   def self.retirer(identifiant_client, pwd_client, montant, clients)
     return [] if identifiant_client== nil || pwd_client==nil|| montant==nil
 
         client= Transaction::TransactionCompte.rechercher( clients, identifiant_client, pwd_client )
   
       if !client.nil? then
 	
 	Transaction::TransactionCompte.retirer_argent( client.pwd_client, montant )
       
       end        
   end
     
   
   def self.deposer( identifiant_client, pwd_client, montant, clients )
     return [] if identifiant_client== nil || pwd_client==nil|| montant==nil
 
     if montant.to_i>0 then      
 
       client= Transaction::TransactionCompte.rechercher( clients, identifiant_client, pwd_client )
      
      if !client.nil? then    	

	Transaction::TransactionCompte.deposer_argent( client.pwd_client,  montant )
      end
     end
   end
    
end