module TodosHelper
  # Cette fonction ce charge d'ajouter la class "selected" en fonction du lien cliqué dans le footer {class: filter_class(nil)}
  # params : [All, Active, Completed]
  def filter_class(filter)
    'selected' if params[:scope] == filter
    #puts "filter #{filter}, params[:scope] : #{params[:scope]}" 
  end
end
