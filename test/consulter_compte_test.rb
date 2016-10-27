require 'test_helper'
require 'GAB'

describe GAB do
  describe ".consulter" do
    
    describe "cas avec aucune compte a consulter" do
      it "retourne [] " do
        GAB.consulter( nil, nil,'bin/db.txt')
          .must_be_empty
      end
    end
    
  end 
end