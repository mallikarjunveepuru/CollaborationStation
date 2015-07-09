class Wiki
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
  field :private, type: Mongoid::Boolean
  has_many :users
end