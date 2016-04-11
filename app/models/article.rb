class Article < ActiveRecord::Base

  belongs_to :product

  validates_presence_of :title, :status
  validates_uniqueness_of  :alias_url, :allow_blank => true

  scope :by_sequence, -> { order('sequence_number') }
  scope :by_updated, -> { order('updated_at desc') }
  scope :active, -> { where('status = ?', true) }
  scope :by_type, -> (type) { where('article_type = ?', type) }
  scope :by_url, -> (url) { self.find_by_alias_url(url) }

end
