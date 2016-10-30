module Transaction
  
def self.retirer_argent(position, file_db, montant)
  
   res= CrudClient.affiche(file_db)       
   
   argent=res[position-1].argent.to_i
   
   if argent>-101 then
     
     nouveauArgent= argent-montant.to_i
     
     if nouveauArgent > -101 then
      
       CrudClient.modifierClient(file_db, position, argent, nouveauArgent)

       resultat= "operation effectuee avec succes"
	  
     else
	    
       resultat= "Desole,vous n''avez pas d'argent"
	  
     end
   end
	
   return resultat

end


def self.deposer_argent(position, file_db, montant)
   
  
  res= CrudClient.affiche(file_db)       
  
  ancien_montant=res[position-1].argent.to_i     
  
  nouveau_montant= ancien_montant+montant.to_i        
  
  CrudClient.modifierClient(file_db, position, ancien_montant, nouveau_montant)

end


end