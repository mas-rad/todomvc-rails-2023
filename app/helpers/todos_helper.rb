module TodosHelper
  def filter_class(filter)
    'selected' if params[:scope] == filter
  end
end
