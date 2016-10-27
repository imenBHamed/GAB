require 'test_helper'
require 'GAB'

describe GAB do
  describe ".creer" do
    
    describe "cas avec inexistance des arguments" do
      it "retourne [] " do
        GAB.deposer( nil, nil,'bin/db.txt',nil)
          .must_be_empty
      end
    end
  end
end
