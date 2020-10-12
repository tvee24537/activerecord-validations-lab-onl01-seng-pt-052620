class Post < ActiveRecord::Base
  
  def clickbait?
    if CLICKERS.none? {|tite| tite.match title}
    # if CLICKERS.none? {|tite| tite.match title}
    #   errors.add(:title, "must be clickbait")
    # end
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
