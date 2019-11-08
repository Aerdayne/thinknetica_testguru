module Admin::BadgesHelper
  def internationalize_collection(collection)
    collection.map { |element| [I18n.t(".badges.#{element}"), element] }
  end
end
