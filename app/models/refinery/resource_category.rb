module Refinery
  class ResourceCategory < Refinery::Core::BaseModel
    self.table_name = 'refinery_resource_categories'

    translates :title

    validates :title, :presence => true

    has_many :resource_categorizations, :class_name => 'Refinery::ResourceCategorization', :dependent => :destroy, :foreign_key => :category_id
    has_many :resources, :class_name => 'Refinery::Resource', :through => :resource_categorizations
  end
end