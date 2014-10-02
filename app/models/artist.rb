class Artist < ActiveRecord::Base
	has_many :prints
  has_many :images, ->{ order(created_at: :asc) }, as: :model_with_image
  accepts_nested_attributes_for :images, allow_destroy: true

	validates_presence_of :name

  def to_param
    "#{id}-#{Russian.transliterate(name).parameterize}"
  end
end
