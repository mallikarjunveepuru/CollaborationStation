class Wiki
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :private, type: Mongoid::Boolean

  belongs_to :user, inverse_of: :collaborators
  has_and_belongs_to_many :collaborators, class_name: "User", inverse_of: :collaborations
  
  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where((private == false) || (private == nil))  }

  after_save do |wiki|
    unless current_user = self.user
      wiki.collaborators << current_user
      current_user.collaborations << wiki
      wiki.save
      current_user.save
    end
  end

end