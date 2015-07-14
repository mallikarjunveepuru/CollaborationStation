class UsersController < ApplicationController
  def new
  end

   def downgrade 
    current_user.update_attribute(:role, 'standard')
    
    current_user.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end
    redirect_to root_path
  end
end
