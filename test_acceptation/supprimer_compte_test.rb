require 'test_helper'
require 'GAB'

describe GAB do
  describe "supprimer" do
    it "supprime un compte client" do
      avec_fichier 'db_file.txt', ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/45216325"] do
        gab( '--file=db_file.txt supprimer_compte imenbh admin admin' )
        contenu_fichier('db_file.txt').must_equal ["admin/admin/hn/000"]
      end
  end
end
end
 
