Refinery::Admin::ResourcesController.class_eval do
  before_filter :find_all_categories, :only => [:new, :edit, :create, :update]
  before_filter :check_category_ids, :only => :update

  protected

  def resource_params
    # update only supports a single file, create supports many.
    if action_name == 'update'
      params.require(:resource).permit(:resource_title, :file, :resource_category_ids => [])
    else
      params.require(:resource).permit(:resource_title, :file => [], :resource_category_ids => [])
    end
  end

  def find_all_categories
    @categories = Refinery::ResourceCategory.all
  end

  def check_category_ids
    params[:resource][:resource_category_ids] ||= []
  end
end