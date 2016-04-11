class Product < ActiveRecord::Base

  has_many :articles

  validates_uniqueness_of  :alias_url, :allow_blank => true

  scope :active, -> { where('status = ?', true) }
  scope :by_url, -> (url) { self.find_by_alias_url(url) }

end
