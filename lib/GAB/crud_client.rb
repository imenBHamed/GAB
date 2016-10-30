module CrudClient
  
  def self.affiche(file_db)
    
    fichier = File.open(file_db, "r")
    clients=[]
    fichier.readlines.each do |ligne|
      
      ligne_f = ligne.split("/")
     
      clients << CompteClient.new(ligne_f[0],ligne_f[1],ligne_f[2],ligne_f[3])
    end
    
    fichier.close
   
    return clients
  
  end
  

  def self.ecrire(file_db, client)
   
     fichier = File.open(file_db, "a")
     
        fichier.puts client.identifiant_client + "/" + client.pwd_client+"/"+client.nom_client+"/"+client.argent
 
      fichier.close   
  end
  
  
    def self.supprimerClient(file_db, identifiant)
   
     fichier = File.open(file_db, "a")
     position=%x{grep -n #{identifiant} #{file_db}}.to_i
     
     if position>0 then
       
	%x{sed -i '/#{identifiant}/d' #{file_db}}
	
	resultat="votre compte a été supprimé!"
	
     else
       resultat="Utilisateur n''existe pas dans la base de donnees"
     end
     
      fichier.close
      
    return resultat
    
  end
  
  def self.rechercher(file_db, identifiant, pwd)
   
     fichier = File.open(file_db, "a")
       
    position= %x{grep -n #{identifiant} #{file_db}}.to_i
    
    position_pwd=%x{grep -n #{pwd} #{file_db}}.to_i
    
      return position if position == position_pwd
      
      fichier.close
      
#     return -1 si position <> position_pwd
      return -1
    
  end
  
  
   def self.modifierClient(file_db, position, ancien_attribut, nouveau_attribut)
   
     fichier = File.open(file_db, "a")
  
     %x{sed -i '#{position}s/#{ancien_attribut}/#{nouveau_attribut}/' #{file_db}}      
     
     fichier.close
    
  end
  
  
 end 
