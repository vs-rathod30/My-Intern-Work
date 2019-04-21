class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  config.generators do |g|
  g.orm :mongoid
  end

end
