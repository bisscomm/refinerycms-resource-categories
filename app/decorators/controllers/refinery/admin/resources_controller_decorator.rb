Refinery::Admin::ResourcesController.class_eval do
  before_filter :find_all_categories, :only => [:new, :edit, :create, :update]
  before_filter :check_category_ids, :only => :update

  protected

  def find_all_categories
    @categories = Refinery::ResourceCategory.all
  end

  def check_category_ids
    params[:resource][:resource_category_ids] ||= []
  end
end

Refinery::Admin::ResourcesController.prepend(
  Module.new do
    def permitted_resource_params
      super << [:resource_category_ids => []]
    end

    def permitted_update_resource_params
      super << [:resource_category_ids => []]
    end
  end
)