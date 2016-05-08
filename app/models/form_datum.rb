class FormDatum < ActiveRecord::Base

  validates :field, :presence => true

end
