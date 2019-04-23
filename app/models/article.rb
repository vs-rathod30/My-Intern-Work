
class Article < ApplicationRecord

has_many :comments, dependent: :destroy
    validates :title, presence: true,
                        length: {minimum: 5}


    def self.search(search)
       # byebug
        if search
            title = Article.find_by(title: search)
                return title if title
              
                Article.all  
        else
            Article.all
        end      
    end              
end
