class Wiki
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :private, type: Mongoid::Boolean
  belongs_to :user
  has_many :users

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where((private == false) || (private == nil))  }

end