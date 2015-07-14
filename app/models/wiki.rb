class Wiki
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :private, type: Mongoid::Boolean
  belongs_to :user
end