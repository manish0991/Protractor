class Article < ActiveRecord::Base
  # No need to declare any property of the object 
  # as they are mapped directly to the table in sqllite3

  validates :title, presence: true,
                    length: { minimum: 5 }

end
