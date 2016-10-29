require 'test_helper'
require 'GAB' 

describe GAB do
  describe ".supprimer" do
    
    describe "cas avec aucun compte a supprimer" do
      it "retourne [] " do
        GAB.creer( nil, nil,nil, nil,nil, 'bin/db.txt')
          .must_be_empty
      end
    end
 
  end
end
 
