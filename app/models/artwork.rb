class Artwork < ActiveRecord::Base
	belongs_to :artist
  belongs_to :collection

  has_many :images, ->{ order(created_at: :asc) }, as: :model_with_image
  accepts_nested_attributes_for :images, allow_destroy: true

  validates_presence_of :title, :year, :price, :artist
  validate :validate_images_present

  default_scope { includes(:images) }

  scope :newest, order: 'created_at DESC'


  private
  def validate_images_present
    unless images.reject(&:marked_for_destruction?).present?
      errors.add(:base, "At least one image is required")
    end
  end
end
