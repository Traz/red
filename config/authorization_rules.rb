authorization do
  # roe guest pour les sessiosn ?
  role :admin do
    has_permission_on [:users, :wiki], to => :manage
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end

  role :guest
    has_permission_on :users, :to => :read do
      if_attribute :role => not_contain 'admin'
    end  
    has_permission_on :wiki, :to => :read do
      if_attribute :public => true
  role :user do
    include :guest
    has_permission_on :users, :to => :update do
      if_attribute :id => {user.id}
    end 
    has_permission_on :wiki, :to => :manage do
      if_attribute :owner => is {user}
    end
    has_permission_on :wiki, :to => :update do
      if_attribute :permission => containt {user}, :private => false
    end
    
    has_permission_on :conversation do
      to :create, :update
      if_attribute :parent_permission => containt {user}, :private => false
    
      
    
  end
  role :user_manager do
    #include :guest
    has_permission_on :users , :to => :manage do
      if_attribute :role => not_contain 'admin'
    end
  end
  role :wiki_manager do
    #include :user
    has_permission_on :wiki do
      to :manage, :revert_to_version
      if_attribute :private => false
    end
  end
    
end

privileges do
  privilege :manage,  :includes => [:new, :create, :read, :edit, :update, :destroy]
  privilege :read,    :includes => [:index, :show]
  privilege :writer, :wiki, :includes => :update
end