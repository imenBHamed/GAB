require 'test_helper'
require 'GAB'

describe GAB do
  describe "creer" do
    it "ajout d'un nouveau compte client" do
      avec_fichier 'db_file.txt', ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/45216325"] do
        gab( '--file=db_file.txt creer_compte walid1 pwdW walid admin admin' )
        contenu_fichier('db_file.txt').must_equal ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/45216325","walid1/pwdW/walid/0"]
      end
  end
end
end
 
