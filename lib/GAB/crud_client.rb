class CrudClient
    
  def self.lire(file_db)
    fichier = File.open(file_db, "r")
    clients=[]
    fichier.readlines.each do |ligne|
      ligne.chomp!
      ligne_f = ligne.split("/")
      
      clients << CompteClient.new(ligne_f[0], ligne_f[1], ligne_f[2], ligne_f[3])
      
    end
    fichier.close
     clients
  end
  
   private

    SEPARATEUR = "/"
  
   def self.enregistrer(file_db, clients)
     fichier = File.open(file_db, "w")
	clients.each do |client|
          fichier.puts( [client.identifiant_client,
                         client.pwd_client,
                         client.nom_client,
                         client.argent].join(SEPARATEUR) )
        end
      fichier.close   
   end
   
 
end 
