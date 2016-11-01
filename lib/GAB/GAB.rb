module GAB
  
   def self.consulter(identifiant_client, pwd_client,file) 
     return [] if identifiant_client== nil || pwd_client==nil
       
     client= Transaction::Compte.rechercher( identifiant_client, pwd_client)
     
      if !client.nil? then 
         "Votre compte contient:#{client.argent}$"
      else
        "Identifiant ou mot de passe sont invalides"
      end
   end
  
  
  def self.creer(nom_client,identifiant_client,pwd_client,identifiant_admin,pwd_admin, file)
    return [] if identifiant_client== nil || pwd_client==nil|| nom_client==nil|| pwd_admin==nil || identifiant_admin==nil
           
     administrateur= Transaction::Compte.rechercher(identifiant_admin, pwd_admin)
         
     client= Transaction::Compte.rechercher( identifiant_client, pwd_client)
     
     if !administrateur.nil? then 
        if client.nil? then
	
	  Transaction::Compte.ajouter_client(CompteClient.new( identifiant_client, pwd_client ,nom_client, "0" ))
	
	  "Votre compte a ete enregistre avec succes dans la base de donnees"
        else
 	   "Utilisateur deja existe dans la base de donnees"
       
        end
      else
          "Vous n'avez pas l''autorisation d''ajouter un nouveau compte"
     end
  end
  
  
   def self.supprimer(identifiant_client, identifiant_admin,pwd_admin,file)
     return [] if identifiant_client== nil || identifiant_admin==nil ||pwd_admin == nil
 
     administrateur= Transaction::Compte.rechercher(identifiant_admin, pwd_admin)
     
     if !administrateur.nil? then
       
 	Transaction::Compte.supprimer_client(identifiant_client)
        "ce compte a ete supprimer avec succes"
     else
        "Vous n'avez pas l''autorisation de supprimer un compte"
     end
   end
   
   
   def self.modifier( identifiant_client, pwd_client, nouveau_pwd_client, db_file )
        return [] if identifiant_client== nil || pwd_client==nil ||nouveau_pwd_client == nil
 
         client= Transaction::Compte.rechercher( identifiant_client, pwd_client)
     
     if !client.nil? then
       
         Transaction::Compte.modifier_client( client.pwd_client, nouveau_pwd_client )
 	 
 	resultat= "Vous avez modifie votre compte!"
         
     else
       resultat="n''existe pas ce client dans la base de donnees"
     end
   end 
   
   
   def self.retirer(identifiant_client, pwd_client, montant, db_file)
     return [] if identifiant_client== nil || pwd_client==nil|| montant==nil
 
         client= Transaction::Compte.rechercher( identifiant_client, pwd_client )
 
       if !client.nil? then
 	
 	resultat= Transaction::Compte.retirer_argent( client.pwd_client, montant )
       
       else
 	
 	 "Identifiant ou mot de passe sont invalides"
       
       end 
       return resultat
   end
   
   
   
   def self.deposer( identifiant_client, pwd_client, montant, db_file )
     return [] if identifiant_client== nil || pwd_client==nil|| montant==nil
 
     if montant.to_i>0 then      
 
       client= Transaction::Compte.rechercher( identifiant_client, pwd_client )
      
      if !client.nil? then    	

	Transaction::Compte.deposer_argent( client.pwd_client,  montant )
	
 	"Depot effectue avec succes"       
      else 	
	"Identifiant ou mot de passe sont invalides"      
       end
     else       
       "montant insuffisant"     
     end
   end

  
   def self.deconnecter()
   
     Transaction::Compte.deconnecter()
     
   end
  
end