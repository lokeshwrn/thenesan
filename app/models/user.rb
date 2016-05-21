class User < ActiveRecord::Base

  validates :user_name, :presence => true, :uniqueness => true
  validates :email_id, :uniqueness => true
  validates :phone, :uniqueness => true
  validates :password, :presence => true
  validates :role, :presence => true

  scope :active, -> { where('status = ?', true) }

end
