module TodosHelper
  def filter_class(filter)
    # TODO, hint use `params[:scope]` to determine if the `selected` class should be added.
    'selected' if params[:scope] == filter
  end
end
