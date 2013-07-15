class Ferret::Features::UserGroupUris < Ferret::Feature::Base
  FEATURE_TYPE = "user_group_uris"
  
end

class Ferret::Subject
  
  def user_groups
    # delegate any caching to the internal code in Subject, but if
    # the uris are cached, then use the cached subjects
    @user_group_map ||= {}
    get_feature_value('user_group_uris', nil).each do |subject_uri|
      @user_group_map[subject_uri] ||= Ferret::Subject.new(subject_uri)
    end
    @user_group_map.values
  end
  
end