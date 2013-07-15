module Ferret::Features; end
class Ferret::Features::HasPermissions < Ferret::Feature::Base
  FEATURE_TYPE = "has_permissions"
  # {
  #   'read' => {'until' => Time.parse('2013/01/01')},
  #   'write' => true
  # }
end

class Ferret::Subject
  
  def permissions(object_uri)
    permissions = []
    ([self] + user_groups).each do |subject|
      subject.get_feature_value('has_permissions', object_uri).each do |permission, entry|
        if !entry['until'] || entry['until'] > Time.now
          permissions << permission
        end
      end
    end
    permissions
  end
  
  def has_permission?(object_uri, permission)
    permissions(object_uri).include?(permission.to_s)
  end
  
end