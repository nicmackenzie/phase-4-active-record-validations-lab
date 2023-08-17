class Post < ApplicationRecord
    validates :title, { presence: true }
    validates :content, { length: { minimum: 250 } }
    validates :summary, { length: { maximum: 250 } }
    validates_inclusion_of :category, in: ['Fiction', 'Non-Fiction']
    validate :sufficiently_clickbait_y

    # def title_is_clickbaity
    #     unless(title.downcase.include? "" )
    #         error.add(:title,"Title not clickbaity")
    #     end
    # end

    # private

    private

    def sufficiently_clickbait_y
        required_phrases = ["Won't Believe", "Secret", /^Top \d+$/, "Guess"]
    
        unless required_phrases.any? { |phrase| title&.match?(phrase) }
          errors.add(:title, "must be sufficiently clickbait-y")
        end
      end

end
