require 'test_helper'
require 'GAB'

describe GAB do
  describe "deposer_argent" do
    it "ajout d'argent au compte client" do
      avec_fichier 'db_file.txt', ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/400"] do
        gab( '--file=db_file.txt deposer_argent imenbh imenbh1 100' )
        contenu_fichier('db_file.txt').must_equal ["admin/admin/hn/000","imenbh/imenbh1/imen_bhamed/500"]
      end
  end
end
end
 
 
