class Gnarlie < ActiveRecord::Base
  belongs_to :user

  validate :image_or_text

  def has_image?
    image_uri && !image_uri.empty?
  end

  def has_text?
    text && !text.empty?
  end

  def image_or_text
    if !has_text? && !has_image?
      errors.add :image_or_text, "must exist."
    end
  end
end
