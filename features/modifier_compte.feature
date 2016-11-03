@wip
Feature: modification d'un compte
  on veux pouvoir effectuer des modifications 
  
    Scenario: modifier le mot de passe d'un compte client 
     Given a file named "db_file.txt" with:
     """
    admin/admin/hn/000
    imenbh/imenbh1/imen_bhamed/45216325
    
     """
     When j'execute `GAB modifier_compte --file= db_file.txt imenbh imenbh1 imenbh2`

     Then the stdout should contain exactly:
     """

     imenbh/imenbh2/imen_bhamed/45216325

     """
 
 
