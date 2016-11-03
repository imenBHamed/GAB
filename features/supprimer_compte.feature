@wip
Feature: supression d'un compte
  on veux pouvoir effectuer des suppressions 
  
    Scenario: supprime un compte client 
     Given a file named "db_file.txt" with:
     """
    admin/admin/hn/000
    imenbh/imenbh1/imen_bhamed/45216325
    
     """
     When j'execute `GAB supprimer_compte --file= db_file.txt imenbh admin admin`

     Then the stdout should contain exactly:
     """

     admin/admin/hn/000

     """
 
 
 
