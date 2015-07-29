module Refinery
  module ResourceCategories
    module Extension
      def has_many_resource_categories
        has_many :resource_categorizations, :class_name => 'Refinery::ResourceCategorization', :dependent => :delete_all, :foreign_key => :resource_id
        has_many :resource_categories, :class_name => 'Refinery::ResourceCategory', :through => :resource_categorizations
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Refinery::ResourceCategories::Extension)