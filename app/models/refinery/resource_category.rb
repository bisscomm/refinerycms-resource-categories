module Refinery
  class ResourceCategory < Refinery::Core::BaseModel
    self.table_name = 'refinery_resource_categories'

    translates :title

    validates :title, :presence => true

    has_many :categorizations, :dependent => :destroy, :foreign_key => :resources_category_id
    has_many :resources, :through => :categorizations, :source => :resource
  end
end