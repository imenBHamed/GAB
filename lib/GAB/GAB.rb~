module GAB
  def self.consulter(identifiant_client,pwd_client,db_file)
     return [] if identifiant_client== nil || pwd_client==nil
     puts identifiant_client.empty?
    ligne = File.open(db_file, "r").readlines
    utilisateur= identifiant_client+"/"+pwd_client
    exist= `#{"grep -n #{utilisateur} #{db_file}"}`
    
    if exist[0].to_i > 0 then
      montant =  ligne[exist[/[ A-Za-z0-9]*:/][/[0-9]+/].to_i-1][/-[ A-Za-z0-9]*/][/[0-9]+/]
      resultat= "Votre compte contient:#{montant}$"
    else
      resultat= "Identifiant ou mot de passe sont invalides"
    end
  end
  
  def self.creer(nom_client,identifiant_client,pwd_client,identifiant_admin,pwd_admin,db_file)
      administrateur= identifiant_admin << "/" << pwd_admin
      utilisateur=identifiant_client << "/" << pwd_client << "/" << nom_client 
      ligne = File.open(db_file, "a")
      
     if `#{"grep -n #{administrateur} #{db_file}"}`.to_i>0 then
       if `#{"grep -n #{utilisateur} #{db_file}"}`.to_i==0 then
	 nouveauCompte= utilisateur << "/" <<  administrateur
	 ligne.puts "\r"+ nouveauCompte
	 resultat= "Votre compte a ete enregistre avec succes dans la base de donnees"
       else
	 resultat= "Utilisateur deja existe dans la base de donnees"
       end
     else
       resultat= "Vous n'avez pas l''autorisation d''ajouter un nouveau compte"
     end
  end
  
  def self.supprimer(identifiant_client, identifiant_admin,pwd_admin,db_file)
    administrateur= identifiant_admin << "/" << pwd_admin  
    position_admin=`#{"grep -n #{administrateur} #{db_file}"}`.to_i  
    position_client= `#{"grep -n #{identifiant_client} #{db_file}"}`.to_i
    
    if position_admin==1 then
      if position_client >1 then
	`#{"sed -i '/#{identifiant_client}/d' #{db_file}"}`
	resultat= "votre compte a été supprimé!"
      else
	resultat= "Utilisateur n''existe pas dans la base de donnees"
      end
    else
      resultat= "Vous n'avez pas l''autorisation de supprimer un compte"
    end
  end
  
  def self.modifier(db_file, identifiant_client,pwd_client, nouveau_pwd_client)
    utilisateur=identifiant_client + "/" + pwd_client 
    exist= `#{"grep -n #{utilisateur} #{db_file}"}`
    if exist.to_i>0 then
      compteur=exist[/[ A-Za-z0-9]*:/][/[0-9]+/].to_i
      if !nouveau_pwd_client.empty? then
	utu=identifiant_client + "/" + nouveau_pwd_client 
	`#{"sed -i '{old}s/#{old}/#{utu}/' #{db_file}"}`
	resultat= "Vous avez modifie votre compte!"
      else
	resultat="vous devez enter un nouveau mot de passe"
      end
    else
      resultat="n''existe pas ce client dans la base de donnees"
    end
  end 
  
  def self.retirer(identifiant_client,pwd_client,db_file,montant) 
    ligne = File.open(db_file, "a+").readlines  
    utilisateur= identifiant_client+"/"+pwd_client
    if montant.to_i>0 then
      exist= `#{"grep -n #{utilisateur} #{db_file}"}`
      compteur=exist[/[ A-Za-z0-9]*:/][/[0-9]+/].to_i
      if exist[0].to_i > 0 then
	argent =  ligne[compteur-1][/-[ A-Za-z0-9]*/][/[0-9]+/]
	if argent.to_i>0 then
	  nouveauArgent= argent.to_i-montant.to_i
	  if nouveauArgent> -101 then
	    `#{"sed -i '#{compteur}s/#{argent}/#{nouveauArgent}/' #{db_file}"}`
	    puts "operation effectuee avec suces"
	  else
	    resultat= "Desole,vous n''avez pas d'argent"
	  end
	end
      else
	resultat= "Identifiant ou mot de passe sont invalides"
      end
    else
      resultat= "montant insuffisant"
    end
  end
  
  def self.deposer(identifiant_client,pwd_client, db_file,montant)      
    utilisateur= identifiant_client+"/"+pwd_client  
    ligne = File.open(db_file, "a+").readlines  
    if montant.to_i>0 then      
      exist= `#{"grep -n #{utilisateur} #{db_file}"}`      
      compteur=exist[/[ A-Za-z0-9]*:/][/[0-9]+/].to_i
      if exist[0].to_i > 0 then        
	ancien_montant =  ligne[compteur-1][/-[ A-Za-z0-9]*/][/[0-9]+/]        
	nouveau_montant= ancien_montant.to_i+montant.to_i        
	`#{"sed -i '#{compteur}s/#{ancien_montant}/#{nouveau_montant}/' #{db_file}"}`
	resultat= "Depot effectue avec succes"
      else
	resultat= "Identifiant ou mot de passe sont invalides"
      end
    else
      resultat= "montant insuffisant"
    end
  end

  
  
end