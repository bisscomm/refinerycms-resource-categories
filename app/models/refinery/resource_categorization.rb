module Refinery
  class ResourceCategorization < Refinery::Core::BaseModel
    self.table_name = 'refinery_resource_categorizations'

    belongs_to :resource, :class_name => 'Refinery::Resource', :foreign_key => :resource_id
    belongs_to :resource_category, :class_name => 'Refinery::ResourceCategory', :foreign_key => :category_id
  end
end
