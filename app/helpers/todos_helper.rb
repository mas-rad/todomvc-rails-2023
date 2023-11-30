module TodosHelper
  def filter_class(filter)
    if params[:scope] == filter
      return 'selected'
    end
  end
end
