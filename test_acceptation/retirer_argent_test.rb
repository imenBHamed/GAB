require 'test_helper'
require 'GAB'

describe GAB do
  describe "retirer_argent" do
    it "retire d'argent du compte client" do
      avec_fichier 'db_file.txt', ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/400"] do
        gab( '--file=db_file.txt retirer_argent imenbh imenbh1 100' )
        contenu_fichier('db_file.txt').must_equal ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/300"]
      end
  end
end
end
 
 
