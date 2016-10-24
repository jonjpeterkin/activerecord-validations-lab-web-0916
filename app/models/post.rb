class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :summary, length: { maximum: 250 }
	validates :content, length: { minimum: 250 }
	validates :category, inclusion: { in: %w{Fiction Non-Fiction} }
	validate :must_be_clickbait

	def must_be_clickbait
		baitphrases = ["Won't Believe", "Secret", "Guess", "Top "]
		if title && !baitphrases.any?{|phrase| title.include?(phrase)}
			errors.add(:title, "Must be clickbait")
		end
	end

end
