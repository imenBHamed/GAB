require 'test_helper'
require 'GAB'

describe GAB do
  describe "consulter" do
    it "affiche le solde du client" do
      avec_fichier 'db_file.txt', ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/45216325"] do
        gab( '--file=db_file.txt consulter_compte imenbh imenbh1' ).
          must_equal ["Votre compte contient:45216325$"]
      end
  end
end
end
