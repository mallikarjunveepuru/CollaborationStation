class Collaborator
  include Mongoid::Document
  belongs_to :user
  belongs_to :wiki
end
