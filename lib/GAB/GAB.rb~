module GAB
  
  def self.consulter(identifiant_client, pwd_client, db_file) 
    return [] if identifiant_client== nil || pwd_client==nil
      
    position=CrudClient.rechercher(db_file, identifiant_client, pwd_client)
    
     if position.to_i > 0 then
 
        res= CrudClient.affiche(db_file)
 
        montant=res[position-1].argent
        
       resultat= "Votre compte contient:#{montant}$"
       
     else
       
       resultat= "Identifiant ou mot de passe sont invalides"
       
     end
  end
  
  
  def self.creer(nom_client,identifiant_client,pwd_client,identifiant_admin,pwd_admin,db_file)
    return [] if identifiant_client== nil || pwd_client==nil|| nom_client==nil|| pwd_admin==nil || identifiant_admin==nil
    

    position_administrateur= CrudClient.rechercher(db_file, identifiant_admin, pwd_admin)
    
    position_client= CrudClient.rechercher(db_file, identifiant_client, pwd_client)

    if position_administrateur > 0 then 
      
       if position_client == -1 then
	 
	CrudClient .ecrire(db_file,CompteClient.new(identifiant_client,pwd_client,nom_client,"0"))
	resultat= "Votre compte a ete enregistre avec succes dans la base de donnees"
       
       else
	 
	 resultat= "Utilisateur deja existe dans la base de donnees"
      
       end
     else
       
       resultat= "Vous n'avez pas l''autorisation d''ajouter un nouveau compte"
     
    end
  end
  
  def self.supprimer(identifiant_client, identifiant_admin,pwd_admin,db_file)
    return [] if identifiant_client== nil || identifiant_admin==nil ||pwd_admin == nil

  
    position_admin = CrudClient.rechercher(db_file, identifiant_admin, pwd_admin)
    
    if position_admin==1 then
      
	 CrudClient.supprimerClient(db_file, identifiant_client)
      
    else
      
      resultat= "Vous n'avez pas l''autorisation de supprimer un compte"
   
    end
  end
  
  
  def self.modifier(db_file, identifiant_client, pwd_client, nouveau_pwd_client)
       return [] if identifiant_client== nil || pwd_client==nil ||nouveau_pwd_client == nil

        position_client= CrudClient.rechercher(db_file, identifiant_client, pwd_client)
    
    if position_client > 0 then
      
	CrudClient.modifierClient(db_file, position_client, pwd_client, nouveau_pwd_client)
	
	resultat= "Vous avez modifie votre compte!"
     
      
    else
      resultat="n''existe pas ce client dans la base de donnees"
    end
  end 
  
  
  def self.retirer(identifiant_client, pwd_client, db_file, montant)
    return [] if identifiant_client== nil || pwd_client==nil|| montant==nil

        position_client= CrudClient.rechercher(db_file, identifiant_client, pwd_client)

      if position_client > 0 then
	
	 Transaction.retirer_argent(position_client, db_file, montant)
      
      else
	
	resultat= "Identifiant ou mot de passe sont invalides"
      
      end   
  end
  
  
  
  def self.deposer(identifiant_client, pwd_client, db_file,montant)
    return [] if identifiant_client== nil || pwd_client==nil|| montant==nil

    if montant.to_i>0 then      
      
      position_client= CrudClient.rechercher(db_file, identifiant_client, pwd_client)
     
      if position_client > 0 then   
	
	Transaction.deposer_argent(position_client, db_file, montant)
	
	resultat= "Depot effectue avec succes"
      
      else
	
	resultat= "Identifiant ou mot de passe sont invalides"
     
      end
    else
      
      resultat= "montant insuffisant"
    
    end
  end

  
  
end