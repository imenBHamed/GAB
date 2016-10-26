module GAB
  def self.consulter(utilisateur,ligne,db_file)
    
      
     
      exist= `#{"grep -n #{utilisateur} #{db_file}"}`
 
       if exist[0].to_i > 0 then
	 
	   montant =  ligne[exist[/[ A-Za-z0-9]*:/][/[0-9]+/].to_i-1][/-[ A-Za-z0-9]*/][/[0-9]+/]
	   resultat= "Votre compte contient:#{montant}$"

       else
	 
	 resultat= "Identifiant ou mot de passe sont invalides"
       end
       resultat
  end
  
  def self.creer(utilisateur,administrateur,ligne,db_file)
    
     if `#{"grep -n #{administrateur} #{db_file}"}`.to_i>0 then
	    if `#{"grep -n #{utilisateur} #{db_file}"}`.to_i==0 then
	      nouveauCompte= utilisateur << "/" <<  administrateur
	      ligne.puts "\r"+ nouveauCompte
	      puts "Votre compte a ete enregistre avec succes dans la base de donnees"
	    else
	      puts "Utilisateur deja existe dans la base de donnees"
	    end
	  else
	    puts "Vous n'avez pas l''autorisation d''ajouter un nouveau compte"
	  end
  end
  
  def self.supprimer(identifiant_client, administrateur,db_file)

   ligne = File.open(db_file, "a+").readlines
      position_admin=`#{"grep -n #{administrateur} #{db_file}"}`.to_i
      position_client= `#{"grep -n #{identifiant_client} #{db_file}"}`.to_i
  if position_admin==1 then
    if position_client >1 then
    `#{"sed -i '/#{identifiant_client}/d' #{db_file}"}`
     puts "votre compte a été supprimé!"
    else
      puts "Utilisateur n''existe pas dans la base de donnees"
    end
  else
    puts "Vous n'avez pas l''autorisation de supprimer un compte"
  end
  end
  def self.modifier(db_file, identifiant_client,pwd_client, nouveau_pwd_client)
    old=identifiant_client + "/" + pwd_client 

   ligne = File.open(db_file, "a+").readlines
       exist= `#{"grep -n #{old} #{db_file}"}`
 	    if exist.to_i>0 then
	      compteur=exist[/[ A-Za-z0-9]*:/][/[0-9]+/].to_i
	      puts compteur
	      if !nouveau_pwd_client.empty? then
		 		         utu=identifiant_client + "/" + nouveau_pwd_client 
   

		   `#{"sed -i 's/#{old}/#{utu}/' #{db_file}"}`
		 	       puts "Vous avez modifie votre compte!"

	     else
	       resultat="vous devez enter un nouveau mot de passe"
	      end
	    else
	      resultat="n''existe pas ce client dans la base de donnees"
	    end 
  
  end 
  
  
  def self.retirer(utilisateur, db_file,montant,ligne)
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
		   puts "Desole,vous n''avez pas d'argent"
		 end
	   end
       else
	 puts "Identifiant ou mot de passe sont invalides"
       end
      else
	puts "montant insuffisant"
      end
  end
  
  def self.deposer(utilisateur,db_file,montant)
          ligne = File.open(db_file, "a+").readlines

      exist= `#{"grep -n #{utilisateur} #{db_file}"}`
      compteur=exist[/[ A-Za-z0-9]*:/][/[0-9]+/].to_i
       if exist[0].to_i > 0 then
	 ancien_montant =  ligne[compteur-1][/-[ A-Za-z0-9]*/][/[0-9]+/]
	 nouveau_montant= ancien_montant.to_i+montant.to_i
	 `#{"sed -i '#{compteur}s/#{ancien_montant}/#{nouveau_montant}/' #{db_file}"}`
	 puts "Depot effectue avec succes"
       else
	 puts "Identifiant ou mot de passe sont invalides"
       end
  end
  
  
  
  
end