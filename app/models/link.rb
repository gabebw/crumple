class Link < ActiveRecord::Base
  validates :url, presence: true
  validate :url_starts_with_scheme

  def missing_scheme?
    URI.parse(url || "").scheme.nil?
  end

  private

  def url_starts_with_scheme
    if missing_scheme?
      errors.add(:url, 'must start with a scheme, like "http://"')
    end
  end
end
