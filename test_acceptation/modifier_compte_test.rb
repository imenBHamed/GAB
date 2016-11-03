require 'test_helper'
require 'GAB'

describe GAB do
  describe "modifier" do
    it "modifie le mote de passe d'un compte client" do
      avec_fichier 'db_file.txt', ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/45216325"] do
        gab( '--file=db_file.txt modifier_compte imenbh imenbh1 imenbh2' )
        contenu_fichier('db_file.txt').must_equal ["admin/admin/hn/000","imenbh/imenbh2/imen_bhamed/45216325"]
      end
  end
end
end
 
