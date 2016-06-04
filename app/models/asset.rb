class Asset < ActiveRecord::Base
  scope :by_sequence, -> { order('sequence_number asc') }
  scope :by_updated, -> { order('updated_at desc') }
  scope :active, -> { where('status =?', true) }
end
