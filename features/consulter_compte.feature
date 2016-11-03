@wip
Feature: consultation du solde d'un client en argument
  on veux pouvoir effectuer des consultations en utilisant l'identifiant et le mot du passe de client en question
  
    Scenario: consulte le solde 
     Given a file named "db_file.txt" with:
     """
    admin/admin/hn/000
    imenbh/imenbh1/imen_bhamed/45216325
    
     """
     When j'execute `GAB consulter_compte --file= db_file.txt imenbh imenbh1`

     Then the stdout should contain exactly:
     """

     Votre compte contient 45216325$

     """
 
