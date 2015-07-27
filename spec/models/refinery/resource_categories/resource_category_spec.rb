require 'spec_helper'

module Refinery
  module ResourceCategories
    describe ResourceCategory do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:resource_category)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
