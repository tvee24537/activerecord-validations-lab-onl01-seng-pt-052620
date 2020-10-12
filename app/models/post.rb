class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  CLICKERS = [
    /Won't Believe/i, 
    /Secret/i, 
    /Top[0-9]*/i, 
    /Guess/i
  ]
  
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
