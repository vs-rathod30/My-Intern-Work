class User
  include Mongoid::Document

  field :name, type: String
  field :speciality, type: String
  
  embeds_many :posts
  
end
