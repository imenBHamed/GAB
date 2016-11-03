 @wip
Feature: retire d'argent d'un compte client
  on veux pouvoir effectuer des retraits d'argent
  
    Scenario: retire d'argent d'un compte client 
     Given a file named "db_file.txt" with:
     """
     admin/admin/hn/000
     imenbh/imenbh1/imen_bhamed/400
    
     """
      When j'execute `GAB retirer_argent --file= db_file.txt imenbh imenbh1 100`

      Then the stdout should contain exactly:
     
     """
    
      admin/admin/hn/000
      imenbh/imenbh1/imen_bhamed/300
      
     """
 

