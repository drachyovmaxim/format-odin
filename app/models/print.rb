class Print < ActiveRecord::Base
	belongs_to :artist
  belongs_to :collection

  has_many :images, ->{ order(created_at: :asc) }, as: :model_with_image
  accepts_nested_attributes_for :images, allow_destroy: true

  acts_as_list

  validates_presence_of :title, :year, :price, :artist
  validate :validate_images_present

  default_scope { order('position ASC').includes(:images) }

  scope :newest, order: 'created_at DESC'

  def to_param
    "#{id}-#{Russian.transliterate(title).parameterize}"
  end

  private
  def validate_images_present
    unless images.reject(&:marked_for_destruction?).present?
      errors.add(:base, "At least one image is required")
    end
  end
end
