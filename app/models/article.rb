class Article < ActiveRecord::Base

scope :by_sequence, -> { order('sequence_number') }
scope :by_updated, -> { order('updated_at desc') }
scope :active, -> { where('status = ?', true) }
scope :by_type, -> (type) { where('article_type = ?', type) }

end
