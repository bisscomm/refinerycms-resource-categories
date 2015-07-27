Refinery::User.find_each do |user|
  user.plugins.where(name: 'refinerycms-resource_categories').first_or_create!(
    position: (user.plugins.maximum(:position) || -1) +1
  )
end if defined?(Refinery::User)
