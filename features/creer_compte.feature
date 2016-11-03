 @wip
Feature: creation d'un nouveau compte client
  on veux pouvoir effectuer des creation de comptes 
  
    Scenario: creation un nouveau compte client 
     Given a file named "db_file.txt" with:
     """
     admin/admin/hn/000
     imenbh/imenbh1/imen_bhamed/45216325
    
     """
      When j'execute `GAB creer_compte --file= db_file.txt walid1 pwdW walid admin admin`

      Then the stdout should contain exactly:
     
     """
    
      admin/admin/hn/000
      imenbh/imenbh1/imen_bhamed/45216325
      walid1/pwdW/walid/0
      
     """
 

