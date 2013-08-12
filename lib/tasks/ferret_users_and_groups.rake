namespace :ferret_users_and_groups do
  desc "create some default user groups"
  task :init do
    FerretUsersAndGroupsRakeHelper.create_super_admin_group
  end
end

module FerretUsersAndGroupsRakeHelper
  
  def self.create_super_admin_group
    Ferret::Feature::DirectUpdater.new(
      {
        'subject_uri' => 'ferret:user_group:super_admin', 
        'feature_type' => 'has_permissions',
        'object_uri' => 'anything'
      }, 
      {
        'read' => true, 
        'create' => true, 
        'edit' => true, 
        'delete' => true
      }, 
      Time.now, 
      {}
    ).update
  end
    
end