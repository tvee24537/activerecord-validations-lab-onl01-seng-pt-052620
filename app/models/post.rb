class Post < ActiveRecord::Base
  
  def clickbait?
    thing = false
    CLICKERS.each do |x|
      if x.match title
      thing = true
      break
    end
    end
    if thing != true 
      errors.add(:title, "must be clickbait")
    end
  end
end
