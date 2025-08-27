class Recipe < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :title, presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
    validates :ingredients, presence: true, length: { minimum: 1 }
    validates :instructions, presence: true, length: { minimum: 1 }
    validates :category, presence: true
    validates :cooking_time, presence: true, numericality: { greater_than: 0, less_than: 1440 } # max 24 hours
    validates :servings, presence: true, numericality: { greater_than: 0, less_than: 100 }
    validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true

    before_save :normalize_data

    validate :ingredients_must_not_be_empty
    validate :instructions_must_not_be_empty

    private
    def normalize_data
        self.title = title&.strip&.downcase
        self.description = description&.strip&.downcase
        self.category = category&.strip&.downcase
        self.image_url = image_url&.strip&.downcase if image_url.present?

        if ingredients.present?
        self.ingredients = ingredients.reject(&:blank?).map { |ingredient| ingredient.strip.downcase }
        end

        if instructions.present?
        self.instructions = instructions.reject(&:blank?).map { |instruction| instruction.strip.downcase }
        end
    end
    def ingredients_must_not_be_empty
        if ingredients.present? && ingredients.reject(&:blank?).empty?
        errors.add(:ingredients, "must have at least one ingredient")
        end
    end

    def instructions_must_not_be_empty
        if instructions.present? && instructions.reject(&:blank?).empty?
        errors.add(:instructions, "must have at least one instruction step")
        end
    end
end
